vim.keymap.set('i', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>')

--Copy on <C-c>
vim.keymap.set('n', '<C-c>', '"+y')
vim.keymap.set('v', '<C-c>', '"+y')

--Paste on <C-v>
vim.keymap.set('n', '<C-v>', '"+p')
vim.keymap.set('v', '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<Esc>"+pa')

--Highlight all on <C-a>
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })
vim.keymap.set('v', '<C-a>', '<Esc>gg0vG$', { desc = 'Select all' })
vim.keymap.set('i', '<C-a>', '<Esc>gg0vG$', { desc = 'Select all' })

-- [  banana,  apple,  orange,  person  ]
-- 'banana'
-- "apple"
-- 'orange'
-- "person"
-- ]
-- stringify words on <leader>as
vim.keymap.set('n', '<leader>as', "viw<esc>a'<esc>bi'<esc>3w", { desc = "Stringify words with ' " })
vim.keymap.set('n', '<leader>aS', 'viw<esc>a"<esc>bi"<esc>3w', { desc = 'Stringify words with " ' })

-- stringify line on <leader>al
vim.keymap.set('n', '<leader>al', "viw<esc>a'<esc>bi'<esc>j", { desc = "Stringify line with ' " })
vim.keymap.set('n', '<leader>aL', 'viw<esc>a"<esc>bi"<esc>j', { desc = 'Stringify line with " ' })
return {}
