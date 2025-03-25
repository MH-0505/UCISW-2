----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:39:45 03/25/2025 
-- Design Name: 
-- Module Name:    generator_dzialan - Behavioral 
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

entity generator_dzialan is
    Port (
        clk   : in  STD_LOGIC;
        start : in  STD_LOGIC;
		poz	  : in  STD_LOGIC_VECTOR (1 downto 0);
        A     : out STD_LOGIC_VECTOR (7 downto 0);
        B     : out STD_LOGIC_VECTOR (7 downto 0);
        Wynik : out STD_LOGIC_VECTOR (7 downto 0)
    );
end generator_dzialan;

architecture Behavioral of generator_dzialan is
    signal A_reg, B_reg : UNSIGNED(7 downto 0) := (others => '0');
    signal Wynik_reg    : UNSIGNED(7 downto 0) := (others => '0');
    signal lfsr_A, lfsr_B : UNSIGNED(7 downto 0) := "01101101"; -- Proste LFSR do generowania pseudo-losowych liczb


begin
	process(clk)
		begin
			if rising_edge(clk) then
				if start = '1' then
					A_reg <= "00000000";
					B_reg <= "00000000";
					
					case poz is
						when "00" =>
							A_reg(3 downto 0) <= lfsr_A(3 downto 0);
							B_reg(3 downto 0) <= lfsr_B(3 downto 0);
						when "01" =>
							A_reg(4 downto 0) <= lfsr_A(4 downto 0);
							B_reg(4 downto 0) <= lfsr_B(4 downto 0);
						when "10" => 
							A_reg(5 downto 0) <= lfsr_A(5 downto 0);
							B_reg(5 downto 0) <= lfsr_B(5 downto 0);
						when "11" => 
							A_reg(6 downto 0) <= lfsr_A(6 downto 0);
							B_reg(6 downto 0) <= lfsr_B(6 downto 0);
						when others =>
							A_reg(6 downto 0) <= lfsr_A(6 downto 0);
							B_reg(6 downto 0) <= lfsr_B(6 downto 0);
					end case;
				else
					-- Normalna praca generatora LFSR
					lfsr_A <= (lfsr_A(6 downto 0) & (lfsr_A(7) xor lfsr_A(6) xor lfsr_A(1) xor lfsr_A(0)));
					lfsr_B <= (lfsr_B(6 downto 0) & (lfsr_B(7) xor lfsr_B(5) xor lfsr_B(4) xor lfsr_B(3)));
				end if;
				-- Obliczenie wyniku
				Wynik_reg <= A_reg + B_reg;
			end if;
		end process;

    A     <= STD_LOGIC_VECTOR(A_reg);
    B     <= STD_LOGIC_VECTOR(B_reg);
    Wynik <= STD_LOGIC_VECTOR(Wynik_reg);

end Behavioral;
