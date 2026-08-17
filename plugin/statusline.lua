-- status line 
local modes = {
  ["n"] =   { text = "NORMAL "        , higroup = "StatusLine"},
  ["no"] =  { text = "NORMAL "        , higroup = "StatusLine"},
  ["v"] =   { text = "VISUAL "        , higroup = "Visual"},
  ["V"] =   { text = "V-LINE "        , higroup = "Visual"},
  ["^V"] =  { text = "V-BLOCK"        , higroup = "Visual"},
  ["s"] =   { text = "SELECT "        , higroup = "Visual"},
  ["S"] =   { text = "S-LINE "        , higroup = "Visual"},
  ["^S"] =  { text = "S-BLOCK"        , higroup = "Visual"},
  ["i"] =   { text = "INSERT "        , higroup = "Search"},
  ["ic"] =  { text = "INSERT "        , higroup = "Search"},
  ["R"] =   { text = "REPLACE"        , higroup = "Cursor"},
  ["Rv"] =  { text = "V-REPL "        , higroup = "Cursor"},
  ["c"] =   { text = "COMMAND"        , higroup = "TermCursor"},
  ["cv"] =  { text = "VIM EX "        , higroup = "StatusLine"},
  ["ce"] =  { text = "EX     "        , higroup = "StatusLine"},
  ["r"] =   { text = "PROMPT "        , higroup = "lCursor"},
  ["rm"] =  { text = "MOAR   "        , higroup = "StatusLine"},
  ["r?"] =  { text = "CONFIRM"        , higroup = "lCursor"},
  ["!"] =   { text = "SHELL  "        , higroup = "TermCursor"},
  ["t"] =   { text = "TERM   "        , higroup = "TermCursor"},
};

local function mode()
    return modes[vim.api.nvim_get_mode().mode].text;
end

local function mode_color()
    local higroup = modes[vim.api.nvim_get_mode().mode].higroup;
    if higroup == nil then
        return "%#StatusLine#";
    else
        return "%#" .. modes[vim.api.nvim_get_mode().mode].higroup .. "#";
    end
end

local function set_statusline()
    vim.opt.statusline = string.format("%s %s", mode_color(), mode());
end

local function set_statusline_triggers()
    vim.api.nvim_create_autocmd('ModeChanged', {
        callback = function()
            set_statusline();
        end
    })
end

--set_statusline();
--set_stausline_triggers();k:w


-- function test()
--     return "abc";
-- end

--vim.opt.statusline = "%{%v:lua.test()%}"
--

-- TODO: make it work with terminals
-- TODO: make it show when a buffer is not yet saved
-- TODO: do not show full file names but only from working dir
-- TODO: show inactive bar as inactive
--
function statusline_builder() 
    local cursor = vim.api.nvim_win_get_cursor(0);

    local line = "";
    line = line .. mode_color();
    line = line .. " " .. mode() .. " ";
    line = line .. "%#StatusLine#";
    line = line .. " " .. vim.api.nvim_buf_get_name(0);
    line = line .. "%=";
    line = line .. cursor[1] .. ":" .. cursor[2] .. "/" .. vim.api.nvim_buf_line_count(0) .. " ";
    return line;
end

function tabline_builder()
    local line = "";
    for tab,_ in pairs(vim.api.nvim_list_tabpages()) do
        -- style the tab if active or not
        if vim.api.nvim_get_current_tabpage() == tab then
            line = line .. "%#TabLineSel#";
        else
            line = line .. "%#TabLine#";
        end

        -- if tab was set using a terminal command use Name from map;
        local tabname = "[" .. tab .. "]";
        for key, tab_mapping in pairs(TAB_MAP) do
            if tab_mapping.tab == tab then
                tabname = "[" .. tab .. ":"  .. key .. "]"; 
            end
        end

        line = line .. " " .. tabname .. " ";
    end

    -- end with right color
    line = line .. "%#TabLineFill#";

    return line;
end

vim.opt.tabline = "%{%v:lua.tabline_builder()%}";
--vim.opt.statusline = "%{%v:lua.statusline_builder()%}";

