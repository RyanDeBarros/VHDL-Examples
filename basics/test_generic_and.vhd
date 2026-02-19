entity test_bench is
end entity test_bench;

architecture test_and_multipler of test_bench is
    signal input: bit_vector(7 downto 0) := (others => '0');
    signal output: bit;
begin
    dut: entity work.and_multiple(behavioural)
        port map ( i => input, y => output );
    stimulus: process is
    begin
        wait for 1 ns;
        assert output = '0';
        input(0) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(1) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(2) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(3) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(4) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(5) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(6) <= '1';

        wait for 1 ns;
        assert output = '0';
        input(7) <= '1';

        wait for 1 ns;
        assert output = '1';
        report "Test done!";
        wait;
    end process stimulus;
end architecture test_and_multipler;
