library ieee;
use ieee.std_logic_1164.all;

entity reg is
    generic ( width: positive );
    port ( d: in bit_vector(0 to width - 1);
           q: out bit_vector(0 to width - 1);
           clk, reset: in bit );
end entity reg;

architecture behavioural of reg is
begin
    behaviour: process (clk, reset) is
        constant zero: bit_vector(0 to width - 1) := (others => '0');
    begin
        if reset = '1' then
            q <= zero;
        elsif clk'event and clk = '1' then
            q <= d;
        end if;
    end process behaviour;
end architecture behavioural;
