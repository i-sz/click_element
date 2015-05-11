----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:37 04/13/2015 
-- Design Name: 
-- Module Name:    fork_click_pipeline - Behavioral 
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

entity fork_click_pipeline is
	port(a_req, b_ack1, b_ack2, a_data, reset, init_clk : in std_logic;
	a_ack, b_req1, b_req2, b_data1, b_data2 : out std_logic);
end fork_click_pipeline;

architecture Behavioral of fork_click_pipeline is

component fork_combo
	port(a_req, b_ack1, b_ack2, a_ack, init_clk : in std_logic;
	combo_out : out std_logic);
end component;

component dflop
	port(clk, data, reset, set : in std_logic;
	Q : out std_logic);
end component;

signal b_req_internal : std_logic;
signal not_b_req_internal : std_logic;

signal combo_out_internal : std_logic;

begin

not_b_req_internal <= not b_req_internal;
b_req1 <= b_req_internal after 8 ns;
b_req2 <= b_req_internal after 8 ns;
a_ack <= b_req_internal;


combo_i : fork_combo port map (
	a_req => a_req,
	b_ack1 => b_ack1,
	b_ack2 => b_ack2,
	a_ack => b_req_internal,
	init_clk => init_clk,
	combo_out => combo_out_internal
	);
	
dflop_ctl : dflop port map (
	clk => combo_out_internal,
	data => not_b_req_internal,
	Q => b_req_internal,
	reset => reset,
	set => '0'
	);
	
-- Data FF removed to keep fork control-only

b_data2 <= a_data;
b_data1 <= a_data;

	
end Behavioral;
