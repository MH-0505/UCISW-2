--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:56:15 03/25/2025
-- Design Name:   
-- Module Name:   testbench
-- Project Name:  UCISW_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generator_dzialan
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    COMPONENT generator_dzialan
    PORT(
         clk   : IN  std_logic;
         start : IN  std_logic;
		 poz   : IN  std_logic_vector(1 downto 0);
         A     : OUT std_logic_vector(7 downto 0);
         B     : OUT std_logic_vector(7 downto 0);
         Wynik : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk   : std_logic := '0';
   signal start : std_logic := '0';
   signal poz   : std_logic_vector(1 downto 0) := "00";

   --Outputs
   signal A     : std_logic_vector(7 downto 0);
   signal B     : std_logic_vector(7 downto 0);
   signal Wynik : std_logic_vector(7 downto 0);
 
   --Clock
   constant clk_period : time := 10 ns;
 
BEGIN
 

    uut: generator_dzialan PORT MAP (
          clk   => clk,
          start => start,
		  poz   => poz,
          A     => A,
          B     => B,
          Wynik => Wynik
        );

	clk_process : process
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process;
 

	stim_proc: process
	begin		

	wait for 100 ns;	

	for i in 1 to 10 loop
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for 100 ns;
	end loop;


	wait;
	end process;

END behavior;
