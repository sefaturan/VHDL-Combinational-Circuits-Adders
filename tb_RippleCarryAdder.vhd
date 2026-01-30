library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_RippleCarryAdder is
end tb_RippleCarryAdder;

architecture Behavioral of tb_RippleCarryAdder is

    component RippleCarryAdder
    Port(
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        C : out STD_LOGIC_VECTOR(4 downto 0)
    );
end component;

    -- Girişler (4 bit)
signal A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

    -- Çıkış (5 bit)
signal C : STD_LOGIC_VECTOR(4 downto 0);

begin

    uut: RippleCarryAdder PORT MAP (
        A => A,
        B => B,
        C => C
    );

    stim_proc: process
    begin
        wait for 100 ns;

        -- Test 1: 2 + 3 = 5 (0010 + 0011 = 00101)
        A <= "0010"; B <= "0011";
        wait for 40 ns;

        -- Test 2: 7 + 1 = 8 (0111 + 0001 = 01000)
        A <= "0111"; B <= "0001";
        wait for 40 ns;

        -- Test 3: Maksimum Değer (Overflow Testi)
        -- 15 + 1 = 16 (1111 + 0001 = 10000) -> 5. bitin (MSB) 1 olduğunu görmelisin.
        A <= "1111"; B <= "0001";
        wait for 40 ns;

        -- Test 4: İki büyük sayı
        -- 10 + 10 = 20 (1010 + 1010 = 10100)
        A <= "1010"; B <= "1010";
        wait for 40 ns;

        wait;
    end process;

end Behavioral;