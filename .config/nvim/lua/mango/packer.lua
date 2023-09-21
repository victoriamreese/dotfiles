-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'johnfrankmorgan/whitespace.nvim',
		config = function ()
			require('whitespace-nvim').setup({
				-- configuration options and their defaults

				-- `highlight` configures which highlight is used to display
				-- trailing whitespace
				highlight = 'DiffDelete',

				-- `ignored_filetypes` configures which filetypes to ignore when
				-- displaying trailing whitespace
				ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help' },

				-- `ignore_terminal` configures whether to ignore terminal buffers
				ignore_terminal = true,
			})

			-- remove trailing whitespace with a keybinding
			vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
	  end
	}

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('tpope/vim-fugitive')
	use('mbbill/undotree')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

end)
