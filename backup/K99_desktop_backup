#!/bin/sh

# Borg Remote Repo
export BORG_REPO=ssh://ubuntu@piserver:22/~/backup/desktop
export BORG_PASSPHRASE='V3o?Cj!\gZL5QYkX'

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting Backup"

# Create Backup

borg create                                         \
    --verbose                                       \
    --filter AME                                    \
    --list                                          \
    --stats                                         \
    --show-rc                                       \
    --compression zstd                              \
    --exclude-caches                                \
    --exclude '/home/felix/DataDisk/lost+found/*'   \
    --exclude '/home/felix/DataDisk/Arbeit/*'       \
    --exclude '/home/felix/DataDisk/DnD/*'          \
    --exclude '/home/felix/DataDisk/Essen/*'        \
    --exclude '/home/felix/DataDisk/Libraries/*'    \
    --exclude '/home/felix/DataDisk/Musik/*'        \
    --exclude '/home/felix/DataDisk/Pokemon/*'      \
    --exclude '/home/felix/DataDisk/Projekte/*'     \
    --exclude '/home/felix/DataDisk/Programme/*'    \
    --exclude '/home/felix/DataDisk/Video/*'        \
                                                    \
    ::'{hostname}-{now}'                            \
    /home/felix/DataDisk                            \
    /home/felix/Sonstiges/felixkydb.kdbx            \

backup_exit=$?

info "Pruning repository"

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily   7                \
    --keep-weekly  4                \
    --keep-monthly 3                \

prune_exit=$?

global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errros"
fi
exit ${global_exit}
