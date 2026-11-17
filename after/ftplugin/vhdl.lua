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

vim.snippet.add(
    "testbench",
[=[
entity $1_tb is
end entity $1_tb;

architecture bhv_$1 of $1_tb is

    constant CLOCK_FREQUENCY    : natural := 5000;
    signal clock_tb             : std_ulogic := '0';
    signal reset_tb             : std_ulogic := '1';

begin
    clock_tb <= (not clock_tb) after (( 1 sec ) / CLOCK_FREQUENCY)/2;

    $2 : entity work.$2_e(rtl_$2_a)
        generic map
        (
        )
        port map
        (
            reset_i => reset_tb,
            clock_i => clock_tb
        );

    stimuli: process
    begin
        -- reset
        reset_tb <= '1';
        wait for 1 ms;
        reset_tb <= '0';

        assert false report "test ende" severity failure;
        wait;
    end process stimuli;

end architecture bhv_$1;
]=]
    ,
    opts
)

vim.snippet.add(
    "library",
[=[
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
]=]
    ,opts
)

vim.snippet.add(
    "map",
[=[
$1 : entity work.$1_e(rtl_$1_a)
    generic map
    (
    )
    port map
    (
        reset_i => reset_tb,
        clock_i => clock_i
    );
]=]
    ,opts
)
