library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decodeunit is 
	port(
		clk : in std_logic;
		instruction : in std_logic_vector(31 downto 0);
		ivalid : in std_logic;
		except : out std_logic;
		aluop : out std_logic_vector(1 downto 0);
		regin : out std_logic_vector(3 downto 0);
		regin2 : out std_logic_vector(3 downto 0);
		wbreg : out std_logic_vector(3 downto 0); 
		cfl  : out std_logic;
		cflid : out std_logic_vector(3 downto 0)
		);
end decodeunit;

architecture decode of decodeunit is 
begin
	process(clk) 
	begin
		if rising_edge(clk) then
			if ivalid = '1' then
				case instruction(31 downto 24) is
					when "00000000" =>
						aluop <= "00";
						regin <= instruction(23 downto 20);
						regin2 <= instruction(19 downto 16);
						wbreg <= instruction(15 downto 12);
				   when "00000001" =>
						aluop <= "01";
						regin <= instruction(23 downto 20);
						regin2 <= instruction(19 downto 16);
						wbreg <= instruction(15 downto 12);
				   when others =>
						except <= '1';
				end case;
			end if;
		end if;
	end process;
end decode;