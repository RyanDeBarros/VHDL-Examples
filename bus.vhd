package common is
    constant Tdelay_synch: time := 5 ns;
end package common;

library ieee;
use ieee.std_logic_1164.all;
use work.common.all;

entity bus_module is
    port (synch: inout std_ulogic; name: in string; start: in bit);
end entity bus_module;

architecture behavioural of bus_module is
begin
    behaviour: process is
    begin
        wait on start;
        synch <= '0';
        wait for Tdelay_synch;
        report "Ready to start operaton - " & name;
        synch <= 'Z' after Tdelay_synch;
        wait until synch = 'H';
        report "Proceed with operation - " & name;
    end process behaviour;
end architecture behavioural;
