library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity test_bench;

architecture test_reg4 of test_bench is
    signal d0, d1, d2, d3, en, clk, q0, q1, q2, q3: bit;
begin
    dut: entity work.reg4(struct)
        port map (d0, d1, d2, d3, en, clk, q0, q1, q2, q3);
    stimulus: process is
    begin
        d0 <= '1'; d1 <= '1'; d2 <= '1'; d3 <= '1';
        en <= '0'; clk <= '0'; wait for 10 ns;
        en <= '1'; wait for 10 ns;
        clk <= '1', '0' after 10 ns; wait for 20 ns;
        d0 <= '0'; d1 <= '0'; d2 <= '0'; d3 <= '0';
        en <= '0'; wait for 10 ns;
        clk <= '1', '0' after 10 ns; wait for 20 ns;
    	report "Test done." severity note;
        wait;
    end process stimulus;
end architecture test_reg4;
