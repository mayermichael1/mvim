-- status line 
local modes = {
  ['IN'] =  { text = "INACTIVE"       , higroup = "StatusLineNC"},
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
  ["nt"] =  { text = "N-TERM "        , higroup = "StatusLine"},
};

local function get_mode_name(mode)
    local text = modes[mode]?.text ?? "";
    return (" "..text.."                    "):sub(1,10);
end

local function get_statusline_higroup(active, terminal)
    if terminal then
        if active then
            return "%#StatusLineTerm#";
        else
            return "%#StatusLineTermNC#";
        end
    else
        if active then
            return "%#StatusLine#";
        else
            return "%#StatusLineNC#";
        end
    end
end

local function get_mode_higroup(mode, active, terminal)
    local higroup = modes[mode]?.higroup;
    if higroup == nil then
        return get_statusline_higroup(active);
    else
        return "%#" .. higroup .. "#";
    end
end

-- TODO: make it show when a buffer is not yet saved

function statusline_builder() 
    local cursor = vim.api.nvim_win_get_cursor(0);
    local mode = vim.api.nvim_get_mode().mode;

    local active = vim.fn.win_getid() == tonumber(vim.g.actual_curwin);

    local terminal = mode:find('t') ~= nil;

    local line = "";

    if not active then
        mode = 'IN';
    end

    line = line .. get_mode_higroup(mode, active, terminal);
    line = line .. get_mode_name(mode);
    line = line .. get_statusline_higroup(active, terminal);
    line = line .. " " .. vim.fn.expand('%');
    line = line .. "%=";
    line = line .. cursor[1] .. "," .. cursor[2] .. "/" .. vim.api.nvim_buf_line_count(0) .. " ";

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
vim.opt.statusline = "%{%v:lua.statusline_builder()%}";

