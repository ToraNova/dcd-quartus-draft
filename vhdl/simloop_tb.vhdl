entity simloop_tb is
end entity;

architecture sim of simloop_tb is
begin

	process is
	begin
	--main  process (looped)
	loop
		--this is an infinite loop
		report "Looping";
		-- depends on run length (set to 10us to run 10 times)
		wait for 1 us;
		--exit;	--uncomment this to break out of the infinite loop
	end loop;

	--code won't reach here unless exit; is uncommented

	end process;
end architecture;
