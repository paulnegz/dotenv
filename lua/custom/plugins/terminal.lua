vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- Function to find an existing terminal buffer
local function find_existing_terminal()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      -- Optionally, check for specific terminal buffers by name or other criteria
      return buf
    end
  end
  return nil
end

-- Function to toggle the terminal
function ToggleTerminal()
  local term_buf = find_existing_terminal()

  if term_buf and vim.api.nvim_buf_is_loaded(term_buf) then
    -- If terminal buffer exists and is loaded, toggle its visibility
    local win = vim.fn.bufwinnr(term_buf)
    if win ~= -1 then
      -- If the terminal is open in a window, close that window
      vim.api.nvim_win_close(vim.fn.win_getid(win), true)
    else
      -- If the terminal exists but is not visible, open it in a split
      vim.api.nvim_command('split | buffer ' .. term_buf)
    end
  else
    -- If no terminal buffer exists, create a new terminal in a split
    vim.api.nvim_command 'split | terminal'
  end
end

-- Optionally, set a keybinding to toggle the terminal
vim.api.nvim_set_keymap('n', '<C-`>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-`>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-`>', '<cmd>stopinsert<CR> :lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-`>', '<cmd>stopinsert<CR> :lua ToggleTerminal()<CR>', { noremap = true, silent = true })

return {}
