package common is
    constant width: positive := 32;
end package common;

library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity test_bench;

architecture test_reg of test_bench is
    signal d: bit_vector(0 to work.common.width - 1);
    signal q: bit_vector(0 to work.common.width - 1);
    signal clk: bit := '0';
    signal reset: bit := '0';

    function as_string(bv: bit_vector) return string is
        variable result: string(1 to bv'length);
    begin
        for i in bv'range loop
            result(i + 1) := character'value(bit'image(bv(i)));
        end loop;
        return result;
    end function as_string;
begin
    dut: entity work.reg(behavioural)
        generic map ( width => work.common.width )
        port map ( d => d, q => q, clk => clk, reset => reset );

    main: process is
    begin
        wait for 300 ns;
        report "Test Done!";
        std.env.stop;
    end process main;

    clock_update: process is
    begin
        clk <= not clk;
        wait for 1 ns;
    end process clock_update;
    
    output_report: process is
    begin
        wait on q for 5 ns;
        report "q = " & as_string(q);
    end process output_report;
    
    reset_update: process is
    begin
        reset <= not reset;
        wait for 12 ns;
    end process reset_update;
    
    input_update: process is
        subtype bv_index is natural range 0 to work.common.width - 1;
        variable index: bv_index := 0;
    begin
        d(index) <= not d(index);
        index := (index + 1) mod (bv_index'high + 1);
        wait for 3 ns;
    end process input_update;
end architecture test_reg;
