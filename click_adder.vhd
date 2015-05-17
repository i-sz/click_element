----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:37 04/13/2015 
-- Design Name: 
-- Module Name:    click_adder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity click_adder is
	port(a_req, b_req, c_ack, reset, init_clk : in std_logic; 
	a_data, b_data : in std_logic_vector(3 downto 0);	 
	a_ack, b_ack, c_req : out std_logic;
	c_data : out std_logic_vector(3 downto 0)
	);
end click_adder;

architecture Behavioral of click_adder is

component adder_combo
	port(a_req, b_req, c_ack, c_req, init_clk : in std_logic;
	combo_out : out std_logic);
end component;


component dflop_ctrl is
	port(clk, reset, set : in std_logic; 
	data : in std_logic; 
	Q : out std_logic
	);
end component;

signal c_req_internal : std_logic;
signal not_c_req_internal : std_logic;

signal combo_out_internal : std_logic;

begin

not_c_req_internal <= not c_req_internal;
c_req <= c_req_internal after 8 ns;
-- Assigning a_ack and b_ack with the same delay to give the next Click element a chance to collect the data
a_ack <= c_req_internal after 8 ns;
b_ack <= c_req_internal after 8 ns;

c_data <= a_data + b_data;

combo_i : adder_combo port map (
	a_req => a_req,
	b_req => b_req,
	c_ack => c_ack,
	c_req => c_req_internal,
	init_clk => init_clk,
	combo_out => combo_out_internal
	);

dflop_ctl : dflop_ctrl port map (
	clk => combo_out_internal,
	data => not_c_req_internal,
	Q => c_req_internal,
	reset => reset,
	set => '0'
	);

end Behavioral;
