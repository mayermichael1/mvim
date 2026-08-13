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
