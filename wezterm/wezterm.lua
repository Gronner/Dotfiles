local wezterm = require 'wezterm';

local mykeys = {
    {key="+", mods="LEADER", action="IncreaseFontSize"},
    {key="-", mods="LEADER", action="DecreaseFontSize"},
    {key="v", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="s", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="n", mods="LEADER", action="ShowTabNavigator"},
    {key="n", mods="LEADER|SHIFT", action="SpawnWindow"},
    {key="t", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="w", mods="LEADER", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    {key="z", mods="LEADER", action="TogglePaneZoomState"},
    {key="c", mods="LEADER|SHIFT", action="Copy"},
    {key="v", mods="LEADER|SHIFT", action="Paste"},
    {key="k", mods="LEADER|SHIFT", action=wezterm.action{ScrollByPage=-1}},
    {key="j", mods="LEADER|SHIFT", action=wezterm.action{ScrollByPage=1}},
    {key="l", mods="LEADER", action="ShowLauncher"},
}

-- Use Leader for Tab Switches
for i = 1, 8 do
    table.insert(mykeys, {
        key=tostring(i),
        mods="LEADER",
        action=wezterm.action{ActivateTab=i-1},
    })
end

return {
    color_scheme = "matrix",

    -- Set costum keybinds with leader enabled
    disable_default_key_bindings = true,
    leader = {key="a", mods="CTRL", timeout_milliseconds=1000},
    keys = mykeys,

    font = wezterm.font_with_fallback({
        "Fira Code",
        "PowerlineExtraSymbols",
    }),

    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,

    launch_menu = {
        {
            args = {"vim"},
        },
        {
            label = "piserver",
            args = {"ssh", "piserver"},
        },
    },

    exit_behavior = "Close",
}
