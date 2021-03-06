----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:22 04/13/2015 
-- Design Name: 
-- Module Name:    three_stage_ring - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity three_stage_ring is
port(
	init, init_clk, set_3, reset_3, init_clk_3 : in std_logic;
	output : out std_logic
);


end three_stage_ring;

architecture Behavioral of three_stage_ring is

component click_pipeline
	port(a_req, b_ack, a_data, reset, set, init_clk : in std_logic;
	a_ack, b_req, b_data : out std_logic);
end component;

signal ack_1, ack_2, ack_3 : std_logic;
signal req_1, req_2, req_3 : std_logic;
signal data_1, data_2, data_3 : std_logic;

begin
click_pipeline_1 : click_pipeline port map (
	a_req => req_3,
	b_req => req_1,
	a_ack => ack_3,
	b_ack => ack_1,
	a_data => data_3,
	b_data => data_1,
	reset => init,
	set => '0',
	init_clk => init_clk
	);
	
click_pipeline_2 : click_pipeline port map (
	a_req => req_1,
	b_req => req_2,
	a_ack => ack_1,
	b_ack => ack_2,
	a_data => data_1,
	b_data => data_2,
	reset => init,
	set => '0',
	init_clk => init_clk
	);
	
click_pipeline_3 : click_pipeline port map (
	a_req => req_2,
	b_req => req_3,
	a_ack => ack_2,
	b_ack => ack_3,
	a_data => data_2,
	b_data => data_3,
	reset => reset_3,
	set => set_3,
	init_clk => init_clk_3
	);

output <= data_3;

end Behavioral;


