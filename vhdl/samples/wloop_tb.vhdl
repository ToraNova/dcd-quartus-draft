entity wloop_tb is
end entity;

architecture sim of wloop_tb is
begin

	process is
	--variable declaration
	variable i : integer := 0;
	begin
	--main  process (looped)

	while i < 10 loop
		report "i=" & integer'image(i);
		i := i + 2;
	end loop;

	report "End";
	wait;

	end process;
end architecture;
