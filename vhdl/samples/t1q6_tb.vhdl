-- tutorial 1 q6 test simulation
-- F(A,B,C,D) = sum minterm(0,2,4,6)
-- what's the diff between 'AND' and 'and' ?

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- this allow the to_unsigned keyword

entity t1q6_tb is
end entity;

architecture sim of t1q6_tb is
	signal abcd : std_logic_vector(0 to 3) := (others => '0'); --input
	signal f : std_logic; --output
	
begin
	procseq : process
	begin
	
	-- test all
	for i in 0 to 2**abcd'length - 1 loop
		abcd <= std_logic_vector(to_unsigned(i, abcd'length));
		--try the with/without following line to observe diff
		wait for 1 ps; -- this is necessary to update abcd first
		f <= (not abcd(0)) and (not abcd(3)); --one may use an entity to test here
		wait for 1 us;
	end loop;

	
	-- Finally, test the wrapped value (back to initial)
	abcd <= (others => '0');
	wait for 1 ps; -- this is necessary to update abcd first
	f <= (not abcd(0)) and (not abcd(3));
	wait for 1 us;
	
	
	report "Done";
	wait;
	end process;
	
end architecture;
