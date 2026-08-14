local function print_list(list)
    for key, value in pairs(list) do 
        print(value);
    end
end

local function in_list(list, needle)
    local found = false;
    for key, value in pairs(list) do 
        if needle == value then
            found = true;
        end
    end
    return found;
end

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


local function spawn(opts, object)
    local current = view_current();

    if view_equal(current, object) then
        print("nothing to do already here");
    else
        if in_list(vim.api.nvim_list_tabpages(), object.tab) then
            vim.cmd.normal(object.tab .. "gt"); 
        else
            vim.cmd('tab split');
        end

        if in_list(vim.api.nvim_list_bufs(), object.buffer) then
            vim.cmd('buffer ' .. object.buffer);
        else
            vim.cmd('terminal');
        end

        set_view(object, view_current());
    end
end

-- actual configuration 

local git = view_empty();
local run_term = view_empty();

vim.api.nvim_create_user_command(
    'Git',
    function(opts)
        spawn(opts, git);
    end,
    {
        desc = 'Spawn a Terminal for Git commands'
    }
)

vim.api.nvim_create_user_command(
    'Term',
    function(opts)
        spawn(opts, run_term);
    end,
    {
        desc = 'Spawn a Terminal for general terminal commands'
    }
)
