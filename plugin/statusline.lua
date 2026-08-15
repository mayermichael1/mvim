-- status line 
local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  ["^V"] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  ["^S"] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
};

local function mode()
    return modes[vim.api.nvim_get_mode().mode];
end

local function mode_color()
    local m = vim.api.nvim_get_mode().mode;
    local color = "%#StatusLineAccent#"
    if m == "n" then
        color = "%#StatusLineAccent#";
    elseif m == "i" then
        color = "%#IncSearch#";
    end
    return color;
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
        if TAB_MAP[tab] != nil then
            line = line .. " " .. tab .. ":" .. TAB_MAP[tab] .. " ";
        else
            line = line .. " " .. tab .. " ";
        end
    end

    -- end with right color
    line = line .. "%#TabLineFill#";

    return line;
end

vim.opt.tabline = "%{%v:lua.tabline_builder()%}"

