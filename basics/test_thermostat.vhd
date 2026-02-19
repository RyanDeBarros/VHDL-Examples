library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity test_bench;

architecture test_thermostat of test_bench is
    signal desired_temp: integer := 30;
    signal actual_temp: integer;
    signal heater_on: boolean;
begin
    thermostat_dut: entity work.thermostat(logic)
        port map (
        	desired_temp => desired_temp,
            actual_temp  => actual_temp,
            heater_on    => heater_on
        );
    heater_dut: entity work.heater(logic)
        port map (
        	heater_on    => heater_on,
            actual_temp  => actual_temp
        );
    stimulus: process is
    begin
        wait for 0 ns;
        report "Actual temp = " & integer'image(actual_temp) severity note;
        wait for 10 ns;
        report "Actual temp = " & integer'image(actual_temp) severity note;
        wait for 10 ns;
        report "Actual temp = " & integer'image(actual_temp) severity note;
        wait for 10 ns;
        report "Actual temp = " & integer'image(actual_temp) severity note;
        wait for 10 ns;
        report "Test done." severity note;
        std.env.stop;
    end process stimulus;
end architecture test_thermostat;
