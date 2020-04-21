-- Hold detector
-- This is a 3 clock cycle hold detector,
-- it detects 3 consecutive 1s
--
-- Written by ToraNova
-- chia_jason96@live.com
-- DCD-quartus-draft project

-- library use declaration
library ieee;
use ieee.std_logic_1164.all;

entity Hold3 is
	port(
		clk, w : in std_logic;
		z : out std_logic
	);
end entity;

architecture logic of Hold3 is
	component DFF is
		port(
			rst, set, clk, d : in std_logic;
			q, qb : out std_logic -- this irks me so much
		);
	end component;

	signal y : std_logic_vector(1 downto 0); --state
	signal dy: std_logic_vector(1 downto 0); --conn
begin
	
	ff0: DFF port map( rst => 'Z', set => 'Z', clk => clk, 
		d => dy(0) , q => y(0), qb => open );
	ff1: DFF port map( rst => 'Z', set => 'Z', clk => clk, 
		d => dy(1), q => y(1), qb => open );
	dy(0) <= (not y(0) or y(1))and w;
	dy(1) <= (y(0) or y(1))and w;
	z <= y(0) and y(1);
	
end architecture;
