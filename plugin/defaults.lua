-- tabstop 
vim.opt.shiftwidth = 4          -- built in operations shift by this amount
vim.opt.softtabstop = -1        -- take the value from shiftwidth
vim.opt.expandtab = true        -- use spaces instead of tabs

-- Searching
vim.opt.hlsearch = false
vim.opt.path:append({"**"})

-- mouse
vim.opt.mouse=""

-- for latex documents
vim.g.tex_flavor="latex"
