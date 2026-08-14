-- generally this section does work but is not really clean
-- i do not really know how lua works and it shows

local function in_list(list, needle)
    local found = false;
    for key, value in pairs(list) do 
        if needle == value then
            found = true;
        end
    end
    return found;
end

-- TODO: better way to create empty objects?
local function view_empty()
    local empty = {};
    empty.buffer = 0;
    empty.channel = 0;
    empty.tab = 0;
    return empty;
end

local function view_current()
    local curr = view_empty();
    curr.buffer = vim.api.nvim_get_current_buf();
    curr.channel = vim.bo.channel;
    curr.tab = vim.api.nvim_get_current_tabpage();
    return curr;
end

local function view_equal(a, b)
    return  a.buffer == b.buffer 
        and a.channel == b.channel 
        and a.tab == b.tab;
end

local function set_view(a, b)
    a.buffer = b.buffer;
    a.channel = b.channel;
    a.tab = b.tab;
end


local function spawn_or_switch(object, command, command_prefix)
    if not view_equal(view_current(), object) then
        if in_list(vim.api.nvim_list_tabpages(), object.tab) then
            vim.cmd.normal(object.tab .. "gt"); 
        else
            vim.cmd('$tab split');
        end

        if in_list(vim.api.nvim_list_bufs(), object.buffer) then
            vim.cmd('buffer ' .. object.buffer);
        else
            vim.cmd('terminal');
            vim.fn.chansend(vim.bo.channel, "clear \r\n");
        end

        set_view(object, view_current());
    end

    if command ~= nil and command ~= "" then
        local channel = view_current().channel;
        local complete_command = string.format("%s %s \r\n",command_prefix, command)
        vim.fn.chansend(channel, {complete_command})
    end
end

local function create_terminal_command(name, prefix)
    local obj = view_empty();

    if prefix == nil then
        prefix = "";
    end

    vim.api.nvim_create_user_command(
        name,
        function(opts)
            spawn_or_switch(obj, opts.args, prefix);
        end,
        {
            nargs = "?",
            desc = 'Spawn a Terminal for ' .. name .. ' commands'
        }
    )
end

-- actual configuration 
create_terminal_command("Git", 'git');
create_terminal_command("Run");
