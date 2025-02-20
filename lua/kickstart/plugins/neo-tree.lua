-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it's the last window open
    popup_border_style = 'rounded', -- Nice rounded borders
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
      -- follow_current_file = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      preview = {
        enabled = true,
      },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
        [']'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
        ['l'] = 'focus_preview',
        ['<C-b>'] = { 'scroll_preview', config = { direction = 10 } },
        ['<C-f>'] = { 'scroll_preview', config = { direction = -10 } },
      },
    },

    event_handlers = {
      {
        event = 'neo_tree_window_after_open',
        handler = function()
          --local state = require('neo-tree.sources.filesystem')._state
        end,
      },
    },

    default_component_configs = {
      preview = {
        enabled = true,
      },
      icon = {
        folder_closed = '📁',
        folder_open = '📂',
      },
    },
  },
}
