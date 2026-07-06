return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      actions = {
        open_file = {
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<CR>", api.node.open.tab, { buffer = bufnr, noremap = true, silent = true, desc = "Open in new tab" })
      end,
    })

    -- Automatically close NvimTree when a file is opened
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("setlocal bufhidden=wipe")
        end
      end,
    })

    -- Set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" }) -- Toggle file explorer

  end,
}

