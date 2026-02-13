library ieee;
use ieee.std_logic_1164.all;

entity thermostat is
port(
    desired_temp, actual_temp: in integer;
    heater_on: out boolean
);
end entity thermostat;

architecture logic of thermostat is
begin
    controller: process is
    begin
        if actual_temp < desired_temp - 2 then
            heater_on <= true;
        elsif actual_temp > desired_temp + 2 then
            heater_on <= false;
        end if;
        wait on actual_temp, desired_temp;
    end process controller;
end architecture logic;

entity heater is
port(
    heater_on: in boolean;
    actual_temp: out integer
);
end entity heater;

architecture logic of heater is
	signal temp: integer := 15;
begin
	actual_temp <= temp;
    update: process is
    begin
        if heater_on then
            temp <= temp + 2;
        else
            temp <= temp - 1;
        end if;
        wait for 1 ns;
    end process update;
end architecture logic;
