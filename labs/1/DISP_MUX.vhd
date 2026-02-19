library ieee;
use ieee.std_logic_1164.all;

entity DISP_MUX is
    port (
        NO_PICS: in integer;
        EXP_TIME: in integer;
        SHOW_TIME: in std_ulogic;
        DISP_PHOTO: out integer
    );
end entity DISP_MUX;

architecture RTL of DISP_MUX is
begin
    process(NO_PICS, EXP_TIME, SHOW_TIME) is
    begin
        if SHOW_TIME = '1' then
            DISP_PHOTO <= EXP_TIME;
        else
            DISP_PHOTO <= NO_PICS;
        end if;
    end process;
end RTL;
