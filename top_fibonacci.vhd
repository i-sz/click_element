library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_fibonacci is
end top_fibonacci;

architecture testbench of top_fibonacci is

component three_stage_ring_fb is
port(
	init, init_clk, set_3, reset_3, init_clk_3 : in std_logic;
	a_req_i, b_ack_i, data_i : in std_logic;
	a_ack_o, b_req_o, data_o : out std_logic
);
end component;

component fork_click_pipeline
	port(a_req, b_ack1, b_ack2, a_data, reset, init_clk : in std_logic;
	a_ack, b_req1, b_req2, b_data1, b_data2 : out std_logic);
end component;

component click_adder
	port(a_req, b_req, c_ack, a_data, b_data, reset, init_clk : in std_logic;
	a_ack, b_ack, c_req, c_data : out std_logic);
end component;


signal init_s : std_logic;
signal init_clk_s : std_logic;
signal output_s : std_logic;
signal set_3_s : std_logic;
signal reset_3_s : std_logic;
signal init_clk_3_s : std_logic;

signal data_1 : std_logic;
signal data_2 : std_logic;
signal data_3 : std_logic;
signal data_4 : std_logic;
signal data_5 : std_logic;
signal ack_1 : std_logic;
signal ack_2 : std_logic;
signal ack_3 : std_logic;
signal ack_4 : std_logic;
signal ack_5 : std_logic;
signal req_1 : std_logic;
signal req_2 : std_logic;
signal req_3 : std_logic;
signal req_4 : std_logic;
signal req_5 : std_logic;

begin

-- First stage of three click elements
ringA : three_stage_ring_fb port map(
	a_req_i => req_5, 
	b_ack_i => ack_1, 
	data_i => data_5,
	a_ack_o => ack_5, 
	b_req_o => req_1, 
	data_o => data_1, 
	init => init_s,
	init_clk => init_clk_s,
	set_3 => set_3_s,
	reset_3 => reset_3_s,
	init_clk_3 => init_clk_3_s
);

-- Second stage of three click elements
ringB : three_stage_ring_fb port map(
	a_req_i => req_2, 
	b_ack_i => ack_4, 
	data_i => data_2, 
	a_ack_o => ack_2, 
	b_req_o => req_4, 
	data_o => data_4, 
	init => init_s,
	init_clk => init_clk_s,
	set_3 => set_3_s,
	reset_3 => reset_3_s,
	init_clk_3 => init_clk_3_s
);

-- Fork from first stage of click elements to second stage of click elements AND adder
fork : fork_click_pipeline port map(
	a_req => req_1, 
	b_ack1 => req_2, 
	b_ack2 => req_3, 
	a_data => data_1, 
	reset => reset_3_s, 
	init_clk => init_clk_s, 
	a_ack => ack_1, 
	b_req1 => req_2, 
	b_req2 => req_3, 
	b_data1 => data_2, 
	b_data2 => data_3 
);

-- Accept input from fork and second stage of click elements, and JOIN to first stage of click elements
adder : click_adder port map(
	a_req => req_4, 
	b_req => req_3, 
	c_ack => req_5, 
	a_data => data_4, 
	b_data => data_3, 
	reset => reset_3_s, 
	init_clk => init_clk_s,
	a_ack => ack_4, 
	b_ack => ack_3, 
	c_req => req_5, 
	c_data => data_5
);

process
begin

-- Initialize all three click elements to 0
init_clk_s <='0';
init_s <= '0';
set_3_s <= '0';
reset_3_s <= '0';
init_clk_3_s <= '0';
wait for 5 ns;
init_s <= '1';
reset_3_s <= '1';
wait for 10 ns;
init_clk_s <= '1';
init_clk_3_s <= '1';
wait for 5 ns;
init_s <= '0';
reset_3_s <= '0';
init_clk_s <= '0';
init_clk_3_s <= '0';
wait for 35 ns;

-- Fire request on the third click element
set_3_s <= '1';
wait for 35 ns;
init_clk_3_s <= '1';
wait for 5 ns;
init_clk_3_s <= '0';
set_3_s <= '0';

wait for 200 ns;

end process;
	   
  

end testbench;

