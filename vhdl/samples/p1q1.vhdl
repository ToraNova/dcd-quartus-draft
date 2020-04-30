-- past year q1b vhdl code

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- this allow the to_unsigned keyword

entity p1q1seq is
	port(
		x, y, c : in std_logic;
		z : out std_logic
	);
end entity;

architecture logic of p1q1seq is
	signal k : std_logic;
begin
	k <= x xor y;
	process(x, y, c)
	variable state : integer := 0;
	begin
	--here defines how p1q1seq will process x and y using pseucode
	-- 00 - A, 01 - B, 10 - C
		if state = 0 then
			z <= '0';
			if k = '0' and c'event and c='1' then
				state := 1;
			end if;
		elsif state = 1 then
			z <= '0';
			if c'event and c='1' then
				if k = '0' then
					state := 2;
				elsif k = '1' then
					state := 0;
				end if;
			end if;
		elsif state = 2 then
			z <= '1';
			if k = '1' and c'event and c='1' then
				state := 0;
			end if;
		end if;
	end process;
end architecture;
