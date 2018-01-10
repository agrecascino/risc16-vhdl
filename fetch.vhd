library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity fetchunit is
	port( 
		clk : in std_logic;
		memlen : in std_logic_vector(1 downto 0);
		memap1 : in std_logic_vector(31 downto 0);
		memenb : in std_logic;
		memdp1 : out std_logic_vector(31 downto 0);
		memrdy : in std_logic;
		bubblethis : in std_logic;
		bubbledecode : out std_logic;
		jump : in std_logic
		);
end fetchunit;

architecture ifu of fetchunit is
	signal infetch : std_logic := '1';
begin
	process(clk)
	begin
		if bubblethis = '0' then
			if memrdy = '1' then
				if infetch = '0' then
					infetch <= '1';
				end if;
			else
			end if;
		end if;
	end process;
end ifu;
		
		