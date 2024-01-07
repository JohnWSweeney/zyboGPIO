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
    component clk_wiz_0
    port
     (-- Clock in ports
      -- Clock out ports
      clk125 : out std_logic;
      clk_in1 : in std_logic
     );
    end component;
    ---------------------------------------------------------------------
	-- Signals
	---------------------------------------------------------------------
	signal	w_clk125    : std_logic;
	signal	w_0		    : std_logic;
	signal	w_state		: integer range 0 to 125000000:= 0;
	signal	w_blink		: std_logic;
	---------------------------------------------------------------------
begin
	---------------------------------------------------------------------
	-- Assignments
	---------------------------------------------------------------------
	clkWizard : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk125 => w_clk125,
        -- Clock in ports
        clk_in1 => sysclk
        );
	---------------------------------------------------------------------
	led				<= w_0;
	---------------------------------------------------------------------
	-- Processes
	---------------------------------------------------------------------
	-- Create a blinking signal.
	---------------------------------------------------------------------
	process(w_clk125)
	begin
		if rising_edge(w_clk125) then
			case w_state is
				when 12500000 =>
					w_blink <= not w_blink;
					w_state <= 0;
				when others =>
					w_state <= w_state + 1;
			end case;
		end if;
	end process;
	---------------------------------------------------------------------
	-- Determine output based on switch state.
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
				w_0 <= w_blink;
			end if;
		end if;
	end process;

end Behavioral;