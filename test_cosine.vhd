entity test_bench is
end entity test_bench;

architecture test_cos of test_bench is
    signal theta, result: real := 0.0;
begin
    dut: entity work.cos(series)
        port map (
            theta  => theta,
            result => result
        );
    stimulus: process is
    begin
        theta <= 0.0;
        wait on result;
        report "cos(0.0)=" & real'image(result);
        theta <= 3.1415927;
        wait on result;
        report "cos(pi)=" & real'image(result);
        theta <= 1.5707963;
        wait on result;
        report "cos(pi/2)=" & real'image(result);
        theta <= 1.0471976;
        wait on result;
        report "cos(pi/3)=" & real'image(result);
        theta <= 2.6179939;
        wait on result;
        report "cos(5*pi/6)=" & real'image(result);
        report "Test done!";
        wait;
    end process stimulus;
end architecture test_cos;
