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

config.colors = {

  foreground = '#c0caf5',
  background = '#1a1b26',
  cursor_bg = '#c0caf5',
  cursor_border = '#c0caf5',
  cursor_fg = '#1a1b26',
  selection_bg = '#283457',
  selection_fg = '#c0caf5',
  split = '#7aa2f7',
  compose_cursor = '#ff9e64',

  ansi = { '#15161e', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#a9b1d6' },
  brights = { '#414868', '#f7768e', '#9ece6a', '#e0af68', '#7aa2f7', '#bb9af7', '#7dcfff', '#c0caf5' },

  tab_bar = {
    inactive_tab_edge = '#16161e',
    background = '#1a1b26',

    active_tab = {
      fg_color = '#16161e',
      bg_color = '#7aa2f7',
    },
    inactive_tab = {
      fg_color = '#545c7e',
      bg_color = '#292e42',
    },
    inactive_tab_hover = {
      fg_color = '#7aa2f7',
      bg_color = '#292e42',
      --intensity = "Bold"
    },
    new_tab_hover = {
      fg_color = '#7aa2f7',
      bg_color = '#1a1b26',
      intensity = 'Bold',
    },
    new_tab = {
      fg_color = '#7aa2f7',
      bg_color = '#1a1b26',
    },
  },
}

config.font = wezterm.font_with_fallback {
  'JetbrainsMono Nerd Font',
  { family = 'PingFang SC', weight = 'Bold' },
  'Apple Color Emoji',
  'Noto Sans CJK',
}
config.text_background_opacity = 1
config.window_background_opacity = 0.7
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
