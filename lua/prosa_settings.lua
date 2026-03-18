-- formatting
vim.opt_local.shiftwidth = 2          -- change from defaults.lua
vim.opt_local.textwidth = 80

-- spell checking (german default)
vim.opt_local.spell = true
vim.opt_local.spelllang = "de"

-- colorcolumns for prosa text
local columns= {};
table.insert(columns, vim.bo.textwidth);
for i = 0,2 
do
    table.insert(columns, 1 + i * vim.bo.shiftwidth);
end
vim.opt_local.colorcolumn = columns
