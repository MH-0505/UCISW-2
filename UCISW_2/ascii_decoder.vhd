----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:29 03/25/2025 
-- Design Name: 
-- Module Name:    ascii_decoder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ascii_decoder is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
			  dec    : out STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end ascii_decoder;

architecture Behavioral of ascii_decoder is
signal char_3, char_2, char_1, char_0 : UNSIGNED(7 downto 0) := (others => '0');
signal value : UNSIGNED (7 downto 0) := input(7 downto 0);

begin
	process(clk)
		begin 
		char_0 <= value / 10;
		
		
	end process
begin


end Behavioral;

