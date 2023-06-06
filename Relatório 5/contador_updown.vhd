-- Relatório 5 Questão 3
--! @file      contador_updown.vhd
--! @brief     Implementação de um contador up-down.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador is
    port( clk : in std_logic;
          clr : in std_logic;
          ld : in std_logic;
          en : in std_logic;
          up_down : in std_logic;
          D : in std_logic_vector (3 downto 0);
          o_f : out std_logic;
          Q : out std_logic_vector (3 downto 0));
end entity;

architecture arch of contador is

begin

process (clk)
variable Q_var : Unsigned(3 downto 0);
begin
    if (rising_edge(clk)) then
        if (clr = '1') then
            Q_var := "0000";
        elsif (ld = '1') then
            Q_var := unsigned(D);
        elsif (en = '1') then 
            if (up_down = '0') then
                if (Q_var = "0000") then o_f <= '1';
                else o_f <= '0'; 
                end if;
                Q_var := Q_var - 1;
            else
                if (Q_var = "1111") then o_f <= '1';
                else o_f <= '0';
                end if;
                Q_var := Q_var + 1;
            end if;
        end if;
        Q <= std_logic_vector( Q_var );
    end if;
end process;
end architecture;