-- ================================================================ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━❰ VIM MAPPINGS ❱━━━━━━━━━━━━━━━━━━━━━━━━ --
--                                                                  --
-- Any custom mapping                                               --
-- ================================================================ --

local set = vim.keymap.set

-- Remaps <SPACE> in normal mode (n) to have no operation (Nop)
-- Just a 'safe' reset of whatever may use the <SPACE> key
set('n', '<SPACE>', '<Nop>')

-- Make the space key the mapleader
vim.g.mapleader = " " -- space is the leader key

-- Configure 'ctrl + left/right' to move between tabs, in normal mode.
-- desc is a description of the mapping
set('n', '<C-[>', ':tabprevious<CR>', { desc = 'Previous tab' })
set('n', '<C-]>', ':tabnext<CR>', { desc = 'Next tab' })

-- Configured <space-g> to clear the search highlighting, in normal mode
set('n', '<leader>g', ':nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Bring up telescope (this mapping is set in telescope.lua
-- set('n', '<leader>sd', require('telescope.builtin').find_files, { desc = 'Find Files in Telescope' })