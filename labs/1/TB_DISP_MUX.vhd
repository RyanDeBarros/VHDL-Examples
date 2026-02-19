library ieee;
use ieee.std_logic_1164.all;

entity TB_DISP_MUX is
end entity TB_DISP_MUX;

architecture TEST of TB_DISP_MUX is
    signal NO_PICS: integer := 0;
    signal EXP_TIME: integer := 0;
    signal SHOW_TIME: std_ulogic := '0';
    signal DISP_PHOTO: integer;
begin
    DUT: entity work.DISP_MUX(RTL)
        port map ( NO_PICS => NO_PICS, EXP_TIME => EXP_TIME, SHOW_TIME => SHOW_TIME, DISP_PHOTO => DISP_PHOTO );
    STIMULI: process
    begin
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 0;

        NO_PICS <= 5;
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 5;
        
        EXP_TIME <= 10;
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 5;
        
        SHOW_TIME <= '1';
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 10;
        
        NO_PICS <= 15;
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 10;
        
        EXP_TIME <= 20;
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 20;
        
        SHOW_TIME <= '0';
        wait on DISP_PHOTO for 5 ns;
        assert DISP_PHOTO = 15;

        report "Test Done!";
        wait;
    end process;
end architecture TEST;

configuration CFG_TB_DISP_MUX of TB_DISP_MUX is
  for TEST
  end for;
end CFG_TB_DISP_MUX;
