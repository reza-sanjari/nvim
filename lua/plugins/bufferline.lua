return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_update_on_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        show_buffer_icons = true,
        separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" |
        indicator = { style = "underline" },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts) -- Uses opts from Lazy.nvim

      local keymap = vim.keymap.set
      local o = { noremap = true, silent = true }

      keymap("n", "<leader>b",  "<nop>",                                        vim.tbl_extend("force", o, { desc = "Buffer" }))
      keymap("n", "<leader>bj", "<cmd>BufferLinePick<cr>",                      vim.tbl_extend("force", o, { desc = "Jump to buffer" }))
      keymap("n", "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>",   vim.tbl_extend("force", o, { desc = "Find buffer" }))
      keymap("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>",                 vim.tbl_extend("force", o, { desc = "Previous buffer" }))
      keymap("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>",                 vim.tbl_extend("force", o, { desc = "Next buffer" }))
      keymap("n", "<leader>BW", "<cmd>noautocmd w<cr>",                         vim.tbl_extend("force", o, { desc = "Save without formatting" }))
      keymap("n", "<leader>be", "<cmd>BufferLinePickClose<cr>",                 vim.tbl_extend("force", o, { desc = "Close picked buffer" }))
      keymap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",                 vim.tbl_extend("force", o, { desc = "Close buffers to the left" }))
      keymap("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>",                vim.tbl_extend("force", o, { desc = "Close buffers to the right" }))
      keymap("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>",           vim.tbl_extend("force", o, { desc = "Sort buffers by directory" }))
      keymap("n", "<leader>bL", "<cmd>BufferLineSortByExtension<cr>",           vim.tbl_extend("force", o, { desc = "Sort buffers by file type" }))
    end,
}

