function vim.snippet.add(trigger, body, opts)
    vim.keymap.set("ia", trigger, function()

        local num = vim.fn.getchar(0)
        local c = vim.fn.nr2char(c)

        -- by default <c-]> also completes an abbreviation
        -- by using below code only this form of completion is allowed

        if c ~= "" then
            vim.api.nvim_feedkeys(trigger .. c, "i", true)
        else 
            vim.snippet.expand(body)
        end

    end, opts)
end
