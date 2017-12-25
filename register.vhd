library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
entity r32 is 
		port(
			clk : in std_logic;
			rval : in std_logic_vector(31 downto 0);
			rout : out std_logic_vector(31 downto 0);
			enable : inout std_logic
		);
end r32;

architecture register32 of r32 is 
begin
		process(clk)
	   begin 
			if rising_edge(clk) then
				if enable = '1' then
					rout <= rval;
				end if;
			end if;
		end process;
end register32;