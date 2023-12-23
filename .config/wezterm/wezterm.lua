local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- local function scheme_for_appearance(appearance)
--   if appearance:find 'Dark' then
--     return 'Catppuccin Mocha'
--   end
-- end
config.color_scheme_dirs = { wezterm.config_dir }
config.color_scheme = 'nightfox'

config.term = 'wezterm'

config.font = wezterm.font_with_fallback {
  { family = 'Jetbrains Mono', weight = 'Light' },
  { family = 'PingFang SC',    weight = 'Bold' },
  'Noto Sans CJK',
  'Apple Color Emoji',
  'Symbols Nerd Font',
}
config.font_size = 12

config.font_rules = {
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'VictorMono',
      weight = 'Bold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = 'VictorMono',
      weight = 'DemiBold',
      style = 'Italic',
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = 'VictorMono',
      style = 'Italic',
    },
  },
}

config.enable_kitty_keyboard = true

config.text_background_opacity = 1
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'
config.hyperlink_rules = {
  -- Linkify things that look like URLs and the host has a TLD name.
  {
    regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
    format = '$0',
  },
  -- linkify email addresses
  {
    regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
    format = 'mailto:$0',
  },
  -- file:// URI
  {
    regex = [[\bfile://\S*\b]],
    format = '$0',
  },

  -- Linkify things that look like URLs with numeric addresses as hosts.
  -- E.g. http://127.0.0.1:8000 for a local development server,
  -- or http://192.168.1.1 for the web interface of many routers.
  {
    regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
    format = '$0',
  },

  -- Make username/project paths clickable. This implies paths like the following are for GitHub.
  -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
  -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
  -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
  -- {
  --   regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  --   format = 'https://www.github.com/$1/$3',
  -- },
}
return config
