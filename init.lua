-- ================================================================ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━❰ NVIM CONFIG ❱━━━━━━━━━━━━━━━━━━━━━━━━━ --
--                                                                  --
-- General Config for NVIM - This file should call upon other,      --
-- specific files.                                                  --
-- ================================================================ --

-- Directory containing any settings/options/tweaks.
require('config.options')

-- Custom mappings. Does not include any
-- filetype specific mappings.
require('config.mappings')

-- Lazy, the package manager for this
-- config. It gets loaded first. Contains
-- list of package calls.
require('config.lazy')

-- Default setup for Comment
-- require('plugins.comment')

-- Default setup for the gruvbox colorscheme
-- require('plugins.gruvbox')

-- Default setup for nvim-tree (file explorer)
-- require('plugins.nvim-tree')

    -- Default setup for nvim-web-devicons (dependency of nvim-tree)
    -- require('plugins.nvim-web-devicons')


-- Treesitter
-- require('plugins.nvim-treesitter')

-- LSP Config
-- require('plugins.nvim-lspconfig')

-- Coq AutoCompletion
-- require('plugins.coq_nvim')
