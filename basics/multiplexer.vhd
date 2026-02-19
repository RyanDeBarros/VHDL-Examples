package common is
	type branch_fn is (br_z, br_nz, br_c, br_nc);
end common;

library ieee;
use ieee.std_logic_1164.all;
use work.common.all;

entity cond_mux is
port(
    sel: in branch_fn;
    cc_z, cc_c: in std_ulogic;
    taken: out std_ulogic
);
end entity cond_mux;

architecture logic of cond_mux is
begin
    out_select: process(sel, cc_z, cc_c) is
    begin
        case sel is
            when br_z =>
                taken <= cc_z;
            when br_nz =>
                taken <= not cc_z;
            when br_c =>
                taken <= cc_c;
            when br_nc =>
                taken <= not cc_c;
        end case;
    end process out_select;
end architecture logic;
