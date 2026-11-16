vim.opt.wildignore:append({"*.wlf"});
vim.opt.wildignore:append({"*/work/*"});
vim.opt.wildignore:append({"*/db/*"});
vim.opt.wildignore:append({"*/simulation/*"});
vim.opt.wildignore:append({"*/output_files/*"});
vim.opt.wildignore:append({"*/incremental_db/*"});

-- latex snippets
local opts = {buffer = 0}

-- General snippets

vim.snippet.add(
    "entity",
[=[
entity $1 is
    generic 
    (
    );
    port
    (
    );
end entity $1;]=]
    ,
    opts
);

vim.snippet.add(
    "architecture",
[=[
architecture $1 of $2 is
begin
end architecture $1;
]=]
    ,
    opts
)
