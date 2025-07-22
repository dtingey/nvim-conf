return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font,
		},
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "sq", function()
					local node = api.tree.get_node_under_cursor()
					if node and node.absolute_path and node.type == "file" then
						require("custom.plugins.sqlite").open_from_path(node.absolute_path)
					else
						vim.api.nvim_err_writeln("Not a valid file node.")
					end
				end, opts("Open SQLite Float"))
			end
			require("nvim-tree").setup({
				on_attach = my_on_attach,
			})
			vim.keymap.set(
				"n",
				"<leader>tt",
				":NvimTreeToggle<CR>",
				{ desc = "[t]oggle tree", noremap = true, silent = true }
			)
		end,
	},
}
