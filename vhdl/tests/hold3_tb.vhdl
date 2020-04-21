-- hold3 component test bench
-- detects 3 consecutive 1's
-- what's the diff between 'AND' and 'and' ?

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- this allow the to_unsigned keyword

entity hold3_tb is
end entity;

architecture sim of hold3_tb is
	signal buf : std_logic_vector(0 to 31); --w buffer
	signal clk, w, z : std_logic; --inputs
	
	component Hold3 is
		port(
		clk, w : in std_logic;
		z : out std_logic
		);
	end component;
	
begin
	h3: Hold3 port map(clk => clk, w => w, z => z);
	
	procseq : process
	begin
	buf <= "00110100100111011100111100110110";
	clk <= '1';
	w <= '0';
	wait for 1 ps;
	clk <= '0';
	wait for 1 ps;
	
	for i in 0 to buf'length - 1 loop
		w <= buf(i);
		clk <= '1';
		wait for 10 ps;
		clk <= '0';
		wait for 10 ps;
	end loop;

	report "Done";
	wait;
	end process;
	
end architecture;
