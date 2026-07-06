return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})

		local noice = require("noice")
		noice.setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})

		vim.keymap.set('n', '<leader>n', '<nop>', { desc = "notify" })
		vim.keymap.set("n", "<leader>nl", function()
			noice.cmd("last")
		end, { desc = "show last message" })

		vim.keymap.set("n", "<leader>nh", function()
			noice.cmd("history")
		end, { desc = "show history" })

		vim.keymap.set("n", "<leader>nt", function()
			noice.cmd("telescope")
		end, { desc = "Telescope" })

		vim.keymap.set("n", "<leader>nd", function()
			noice.cmd("dismiss")
		end, { desc = "dismiss all messages" })

		require("telescope").load_extension("noice")
	end,
}
