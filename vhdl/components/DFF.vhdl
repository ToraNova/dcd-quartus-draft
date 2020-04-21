-- Fulladder1bit Entity
-- Describes the Entity/Arch pair for a 1-bit full adder
-- This file shall contain no more than the entity (interface)
-- and its architecture (logic). Name of file shall be same as that of entity
--
-- Written by ToraNova
-- chia_jason96@live.com
-- DCD-quartus-draft project

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;

-- only the first char in entity names are capitalized
entity DFF is
	port(
		rst, set, clk, d : in std_logic;
		q, qb : out std_logic -- this irks me so much
	);
end entity;

-- the architecture of the entity bears the same name
-- it definen how the circuit process the I/O
architecture logic of DFF is
begin 
	process(rst, set, clk, d)
	begin
		if rst='1' then
			q <= '0';
			q <= '1';
		elsif set='1' then
			q <= '1';
			q <= '0';
		elsif clk'event and clk='1' then
			q <= d;
			qb <= not d;
		end if;
		--qb <= not q; --doesn't work
	end process;
end architecture;
