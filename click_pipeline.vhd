----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:37 04/13/2015 
-- Design Name: 
-- Module Name:    click_pipeline - Behavioral 
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

entity click_pipeline is
	port(a_req, b_ack, a_data, reset, set, init_clk : in std_logic;
	a_ack, b_req, b_data : out std_logic);
end click_pipeline;

architecture Behavioral of click_pipeline is

component combo
	port(a_req, b_ack, a_ack, init_clk : in std_logic;
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
b_req <= b_req_internal;
a_ack <= b_req_internal;

combo_i : combo port map (
	a_req => a_req,
	b_ack => b_ack,
	a_ack => b_req_internal,
	init_clk => init_clk,
	combo_out => combo_out_internal
	);

dflop_data : dflop port map (
	clk => combo_out_internal,
	data => a_data,
	Q => b_data,
	reset => reset,
	set => set
	);
	
dflop_ctl : dflop port map (
	clk => combo_out_internal,
	data => not_b_req_internal,
	Q => b_req_internal,
	reset => reset,
	set => set
	);

end Behavioral;

