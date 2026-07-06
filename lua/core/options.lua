vim.opt.termguicolors = true
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local uname = vim.fn.system("uname -r"):lower()
if uname:find("microsoft") then
    vim.g.clipboard = {
        name = "win32yank",
        copy  = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
        paste = { ["+"] = "win32yank.exe -o --lf",   ["*"] = "win32yank.exe -o --lf"   },
    }
else
    vim.g.clipboard = {
        name = "xclip",
        copy  = { ["+"] = "xclip -i -selection clipboard", ["*"] = "xclip -i -selection clipboard" },
        paste = { ["+"] = "xclip -o -selection clipboard", ["*"] = "xclip -o -selection clipboard" },
    }
end

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undo", "p")
