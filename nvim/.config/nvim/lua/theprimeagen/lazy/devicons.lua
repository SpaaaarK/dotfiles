
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

return {
    'nvim-tree/nvim-web-devicons',
    opts = {},
    config = function()
        require("nvim-web-devicons").setup({
            override = {
                bb = {
                    icon = "",
                    color = colors.cyan,
                    cterm_color = "208",
                    name = "BitBake",
                },
                bbappend = {
                    icon = "",
                    color = colors.green,
                    cterm_color = "208",
                    name = "BitBakeAppend",
                },
                bbclass = {
                    icon = "",
                    color = "#ff9900",
                    cterm_color = "208",
                    name = "BitBakeClass",
                },
                conf = {
                    icon = "⚙️",
                    color = colors.yellow,
                    cterm_color = "242",
                    name = "BitBakeConf",
                },
            },
        })
    end,
}
