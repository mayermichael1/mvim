-- tabstop 
vim.opt.shiftwidth = 4          -- built in operations shift by this amount
vim.opt.softtabstop = -1        -- take the value from shiftwidth
vim.opt.expandtab = true        -- use spaces instead of tabs

-- Searching
vim.opt.hlsearch = false
-- try without for a while 
-- should give a better overview over the current projects structure 
-- vim.opt.path:append({"**"})

-- mouse
vim.opt.mouse=""

-- for latex documents
vim.g.tex_flavor="latex"

-- file encodings, formatting and more
vim.g.fileencoding="utf-8"
vim.g.fileformat="unix"
