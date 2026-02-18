library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity test_bench;

architecture test_bus_module of test_bench is
    signal synch_control: std_logic;
    constant name_1: string := "Bus 1";
    signal start_1: bit := '0';
    constant name_2: string := "Bus 2";
    signal start_2: bit := '0';
begin
    synch_control_pull_up: synch_control <= 'H';
    bus_module_1: entity work.bus_module(behavioural)
        port map (
            synch => synch_control,
            name  => name_1,
            start => start_1
        );
    bus_module_2: entity work.bus_module(behavioural)
        port map (
            synch => synch_control,
            name  => name_2,
            start => start_2
        );
    stimulus: process is
    begin
        start_1 <= '1' after 1 ns;
        start_2 <= '1' after 2 ns;
        
        wait until synch_control = 'H';
        start_1 <= '0' after 1 ns;
        start_2 <= '0' after 2 * work.common.Tdelay_synch;

        wait until synch_control = 'H';
        wait for 1 ns;
        report "Test Done!";
        wait;
    end process stimulus;
end architecture test_bus_module;
