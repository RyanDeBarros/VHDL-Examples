library ieee;
use ieee.std_logic_1164.all;

----------------------------------------

entity d_ff is
port(
	d, clk: in bit;
    q: out bit
);
end entity d_ff;

architecture basic of d_ff is
begin
	ff_behavior: process is
    begin
    	wait until clk = '1';
        q <= d after 2 ns;
	end process ff_behavior;
end architecture basic;

----------------------------------------

entity and2 is
port(
	a, b: in bit;
    y: out bit
);
end entity and2;

architecture basic of and2 is
begin
	and2_behavior: process is
    begin
    	y <= a and b after 2 ns;
        wait on a, b;
    end process and2_behavior;
end architecture basic;

----------------------------------------

entity reg4 is
port(
	d0, d1, d2, d3, en, clk: in bit;
    q0, q1, q2, q3: out bit
);
end entity reg4;

architecture struct of reg4 is
	signal int_clk: bit;
begin
	bit0: entity work.d_ff(basic)
    	port map (d0, int_clk, q0);
	bit1: entity work.d_ff(basic)
    	port map (d1, int_clk, q1);
	bit2: entity work.d_ff(basic)
    	port map (d2, int_clk, q2);
	bit3: entity work.d_ff(basic)
    	port map (d3, int_clk, q3);
    gate: entity work.and2(basic)
    	port map (en, clk, int_clk);
end architecture struct;

architecture behav of reg4 is
begin
	storage: process is
    	variable stored_d0, stored_d1, stored_d2, stored_d3: bit;
    begin
    	wait until clk = '1';
        if en = '1' then
        	stored_d0 := d0;
        	stored_d1 := d1;
        	stored_d2 := d2;
        	stored_d3 := d3;
        end if;
        q0 <= stored_d0 after 5 ns;
        q1 <= stored_d1 after 5 ns;
        q2 <= stored_d2 after 5 ns;
        q3 <= stored_d3 after 5 ns;
    end process storage;
end architecture behav;
