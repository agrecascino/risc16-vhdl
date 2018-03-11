entity writeback is 
	port(
		clk : in std_logic;
		enable : out std_logic;
		input : in std_logic_vector(31 downto 0);
		regoutput : out std_logic_vector(31 downto 0);
		memoutput : out std_logic_vector(31 downto 0);