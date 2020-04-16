entity forloop_tb is
end entity;

architecture sim of forloop_tb is
begin

	process is
	begin
	--main  process (looped)
	for i in 9 downto 0 loop
		report "Down:" & integer'image(i);
	end loop;

	for i in 0 to 9 loop
		report "Up:" & integer'image(i);
	end loop;

	report "End";
	wait;
	end process;
end architecture;
