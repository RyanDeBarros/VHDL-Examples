library ieee;
use ieee.std_logic_1164.all;
use work.common.all;

entity test_bench is
end entity test_bench;

architecture test_mux of test_bench is
    signal sel: branch_fn;
    signal cc_z, cc_c: std_ulogic;
    signal taken: std_ulogic;
begin
    dut: entity work.cond_mux(logic)
        port map (
            sel   => sel,
            cc_z  => cc_z,
            cc_c  => cc_c,
            taken => taken
        );
    stimulus: process is
    begin
        cc_z <= '0'; cc_c <= '0';
        sel <= br_z; wait for 1 ns;
        assert taken = '0';
        sel <= br_nz; wait for 1 ns;
        assert taken = '1';
        sel <= br_c; wait for 1 ns;
        assert taken = '0';
        sel <= br_nc; wait for 1 ns;
        assert taken = '1';

        cc_z <= '0'; cc_c <= '1';
        sel <= br_z; wait for 1 ns;
        assert taken = '0';
        sel <= br_nz; wait for 1 ns;
        assert taken = '1';
        sel <= br_c; wait for 1 ns;
        assert taken = '1';
        sel <= br_nc; wait for 1 ns;
        assert taken = '0';

        cc_z <= '1'; cc_c <= '0';
        sel <= br_z; wait for 1 ns;
        assert taken = '1';
        sel <= br_nz; wait for 1 ns;
        assert taken = '0';
        sel <= br_c; wait for 1 ns;
        assert taken = '0';
        sel <= br_nc; wait for 1 ns;
        assert taken = '1';

        cc_z <= '1'; cc_c <= '1';
        sel <= br_z; wait for 1 ns;
        assert taken = '1';
        sel <= br_nz; wait for 1 ns;
        assert taken = '0';
        sel <= br_c; wait for 1 ns;
        assert taken = '1';
        sel <= br_nc; wait for 1 ns;
        assert taken = '0';

        report "Test done!";
        wait;
    end process stimulus;
end architecture test_mux;
