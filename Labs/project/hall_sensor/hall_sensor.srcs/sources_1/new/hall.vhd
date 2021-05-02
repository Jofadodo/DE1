----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2021 18:07:26
-- Design Name: 
-- Module Name: hall - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hall is
    port(
            clk            : in std_logic;    -- main clock
            hall_sensor    : in std_logic;    -- hall_sensor input
            wheel_circuit  : in integer;      -- integer input of wheel circuit
            
            mode_BTN       : in std_logic;    -- button input for setting display mode
            reset_BTN      : in std_logic;    -- button input for resetting distance
            
            number         : out integer      -- integer output of speed/distance
        );
end hall;

architecture Behavioral of hall is

    signal s_reset     : std_logic;       -- internal reset for time stop
    signal s_run       : std_logic;       -- internal variable for running timer for wheel rotation
    signal s_mode      : std_logic:='0';  -- internal variable for display mode
    
    signal s_runtime   : integer;         -- variable for wheel rotation time
    signal speed       : integer:=0;      -- variable for calculated speed
    signal distance    : integer:=0;      -- variable for calculated distance
    
    constant speed_calculation : integer:=1000;

begin

    -- instance copy of time_enable entity
    time_stop : entity work.time_enable
        port map(
            runtime => s_runtime,
            clk     => clk,
            reset   => s_reset,
            run     => s_run
        );
       
------------------------------------------------------------------------
-- Process speed_calc:
-- every time when hall_sensor is enabled, process calculates speed
--
-- using speed_calculation constant for correct simulation, when used in
-- real time, constants must be changed
------------------------------------------------------------------------
    speed_calc : process(clk)
    begin
    
        if (s_reset = '1') then 
            s_reset <= '0';
        end if;
    
        if (rising_edge(hall_sensor)) then
            speed <= (wheel_circuit * speed_calculation) / (s_runtime + 1); 
                 
            s_reset <= '1';
        end if;
        
    end process;
    
------------------------------------------------------------------------
-- Process dist_calc:
-- every time when hall_sensor is enabled, process calculates distance
------------------------------------------------------------------------
    dist_calc : process(clk, hall_sensor)
    begin
    
        if (rising_edge(hall_sensor)) then
        
            distance <= distance + (wheel_circuit / 100); -- wheel circuit int mm must be calculated to m, used 100 for displaying decimal point
            
        end if;
        
        if (rising_edge(reset_BTN)) then
            distance <= 0;
        end if;
        
    end process;
    
------------------------------------------------------------------------
-- Process view:
-- changing displayed values (speed / distance)
------------------------------------------------------------------------
    view : process(clk)
    begin
    
        if (rising_edge(mode_BTN)) then
            s_mode <= not(s_mode);
        end if;
        
        case s_mode is
            when '0' =>
                number <= speed;
            when '1' =>
                -- if distance is greater or equals 1 km, the distance is divided by 1000
                if(distance >= 10000) then 
                    number <= distance / 1000;
                else number <= distance;
                end if;
            when others =>
                number <= speed;
        end case;
        
    end process;

end Behavioral;
