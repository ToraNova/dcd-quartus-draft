-- past year q1b vhdl code

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- this allow the to_unsigned keyword

-- -----------------------------------------
-- MAIN function snippet
-- -----------------------------------------
entity p1q1_tb is
end entity;

architecture sim of p1q1_tb is
	signal x, y, z : std_logic;
	signal c : std_logic := '0';
	component p1q1seq is
		port(
			x, y, c : in std_logic;
			z : out std_logic
		);
	end component;
begin
	p : p1q1seq port map (x=>x, y=>y, c=>c, z=>z);
	procseq : process
	begin
		x <= '0';
		y <= '0'; -- k = 0
		wait for 10 ns; -- register the signal
		c <= '1';
		wait for 10 ns; -- register the signal
		c <= '0';
		wait for 1 us; -- be at state B

		x <= '0';
		y <= '0'; -- k = 0
		wait for 10 ns; -- register the signal
		c <= '1';
		wait for 10 ns; -- register the signal
		c <= '0';
		wait for 1 us; -- be at state C

		x <= '0';
		y <= '1'; -- k = 1
		wait for 10 ns; -- register the signal
		c <= '1';
		wait for 10 ns; -- register the signal
		c <= '0';
		wait for 1 us; -- be at state A

		report "Done";
		wait;
	end process;
end architecture;
