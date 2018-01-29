library work;
use work.types.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity regbank32 is
	port(
		clk : in std_logic;
		enable : in std_logic;
   	regp1 : in std_logic_vector(3 downto 0);
		regp2 : in std_logic_vector(3 downto 0);
		regp3 : in std_logic_vector(3 downto 0);
		rval : in std_logic_vector(31 downto 0);
		rout : out std_logic_vector(31 downto 0);
		rout2 : out std_logic_vector(31 downto 0)
	);
end regbank32;	

library work;
use work.all;
architecture bank of regbank32 is
	type regtype is array(0 to 15) of std_logic_vector(31 downto 0);
	signal registers : regtype;
begin
	process (clk)
	begin
		if falling_edge(clk) then
			if enable = '1' then
				registers(to_integer(unsigned(regp3))) <= rval;
			end if;
			rout <= registers(to_integer(unsigned(regp1)));
			rout2 <= registers(to_integer(unsigned(regp2)));
		end if;
	end process;
end bank;