entity helloworld_tb is
end entity;

architecture sim of helloworld_tb is
begin

	process is
	begin
	--main process
	report "Hello World";
	wait;

	end process;
end architecture;
