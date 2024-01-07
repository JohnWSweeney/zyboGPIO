----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/06/2024 04:29:35 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

entity main is
	Port (
		sysclk			: in std_logic;
		led				: out std_logic;
		btn				: in std_logic;
		sw				: in std_logic
	);
end main;

architecture Behavioral of main is
	---------------------------------------------------------------------
	-- Signals
	---------------------------------------------------------------------
	signal	w_clk125    : std_logic;
	signal	w_0		    : std_logic;
	---------------------------------------------------------------------
begin
	---------------------------------------------------------------------
	-- Assignments
	---------------------------------------------------------------------
	w_clk125		<= sysclk;
	led				<= w_0;
	---------------------------------------------------------------------
	-- Processes
	---------------------------------------------------------------------
	process(w_clk125)
	begin
		if rising_edge(w_clk125) then
			if sw = '1' then
				if btn = '1' then
					w_0 <= '1';
				else
					w_0 <= '0';
				end if;
			else
				w_0 <= '0';
			end if;
		end if;
	end process;

end Behavioral;