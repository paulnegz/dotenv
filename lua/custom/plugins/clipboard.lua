return {
  -- Save on <C-s>
  vim.keymap.set('i', '<C-s>', '<cmd>w<CR>'),
  vim.keymap.set('n', '<C-s>', '<cmd>w<CR>'),

  --Copy on <C-c>
  vim.keymap.set('n', '<C-c>', '"+y'),
  vim.keymap.set('v', '<C-c>', '"+y'),

  --Paste on <C-v>
  vim.keymap.set('n', '<C-v>', '"+p'),
  vim.keymap.set('v', '<C-v>', '"+p'),
  vim.keymap.set('i', '<C-v>', '<Esc>"+pa'),

  --Highlight all on <C-a>
  vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' }),
  vim.keymap.set('v', '<C-a>', '<Esc>gg0vG$', { desc = 'Select all' }),
  vim.keymap.set('i', '<C-a>', '<Esc>gg0vG$', { desc = 'Select all' }),
}
