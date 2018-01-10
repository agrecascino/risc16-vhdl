library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;
architecture r32 of de0_nano_soc_baseline is
	component regbank32
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
	end component;
	component alu32 
	port(
		clk : in std_logic;
		op  : in std_logic_vector(1 downto 0);
		except : out std_logic;
		etype : out std_logic_vector(1 downto 0);
		in1 : in std_logic_vector(31 downto 0);
		in2 : in std_logic_vector(31 downto 0);
		out1 : out std_logic_vector(31 downto 0);
		extend : out std_logic_vector(31 downto 0)
	);
	end component;
	component r32 is 
	port(
		clk : in std_logic;
		rval : in std_logic_vector(31 downto 0);
		rout : out std_logic_vector(31 downto 0);
		enable : inout std_logic
	);
	end component;
	signal enable : std_logic := '0';
	signal port1  : std_logic_vector(3 downto 0) := "0000";
	signal port2  : std_logic_vector(3 downto 0) := "0000";
	signal port3  : std_logic_vector(3 downto 0) := "0000";
	signal reginput : std_logic_vector(31 downto 0);
	signal regout1 : std_logic_vector(31 downto 0);
	signal regout2 : std_logic_vector(31 downto 0);
	signal aluop : std_logic_vector(1 downto 0) := "00";
	signal aluexcept : std_logic := '0';
	signal aluetype : std_logic_vector(1 downto 0) := "00";
	signal aluin1 : std_logic_vector(31 downto 0) := x"00000000";
	signal aluin2 : std_logic_vector(31 downto 0) := x"00000000";
	signal aluout : std_logic_vector(31 downto 0) := x"00000000";
	signal alutop : std_logic_vector(31 downto 0) := x"00000000";
	signal macclen : std_logic_vector(1 downto 0) := "00";
	signal maccadd : std_logic_vector(31 downto 0) := x"00000000";
	signal maccwen : std_logic := '0';
	signal maccren : std_logic := '0';
	signal maccdat : std_logic_vector(31 downto 0) := x"00000000";
	signal maccuna : std_logic := '0';
	signal maccrdy : std_logic := '0';
	signal pcin : std_logic_vector(31 downto 0);
	signal pcout : std_logic_vector(31 downto 0);
	signal pcenable : std_logic;
	
begin
	b32 : regbank32 port map(FPGA_CLK_50, enable, port1, port2, port3, reginput, regout1, regout2);
	a32 : alu32 port map(FPGA_CLK_50, aluop, aluexcept, aluetype, aluin1, aluin2, aluout, alutop);
	mem : memctrl port map(FPGA_CLK_50, macclen, maccadd, maccwen, maccren, maccdat, maccuna, maccrdy);
	pc  : r32 port map(FPGA_CLK_50, pcin, pcout, pcenable);
	process(FPGA_CLK_50)
	begin
		if rising_edge(FPGA_CLK_50) then
			
			port1 <= "0000";
			port2 <= "0000";
			enable <= '1';
			reginput <= aluout;
			led <= regout1(23 downto 16);
			aluop(0) <= '1';
			aluin1 <= regout1;
			aluin2 <= x"00000001";
		end if;
	end process;
end r32;