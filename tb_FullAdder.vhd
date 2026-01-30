library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_FullAdder is
end tb_FullAdder;

architecture Behavioral of tb_FullAdder is

    component FullAdder
    Port(
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC;
        d : out STD_LOGIC_VECTOR(1 downto 0)
    );
end component;

    -- Giriş sinyalleri
signal a : STD_LOGIC := '0';
signal b : STD_LOGIC := '0';
signal cin : STD_LOGIC := '0';

    -- Çıkış sinyali
signal d : STD_LOGIC_VECTOR(1 downto 0);

begin

    uut: FullAdder PORT MAP (
        a => a,
        b => b,
        c => cin,
        d => d
    );

    stim_proc: process
    begin
        wait for 100 ns;

        -- Tüm kombinasyonları (000'dan 111'e) deneyelim
        a <= '0'; b <= '0'; cin <= '0'; wait for 20 ns; -- 0+0+0 = 0
        a <= '0'; b <= '0'; cin <= '1'; wait for 20 ns; -- 0+0+1 = 1
        a <= '0'; b <= '1'; cin <= '0'; wait for 20 ns; -- 0+1+0 = 1
        a <= '0'; b <= '1'; cin <= '1'; wait for 20 ns; -- 0+1+1 = 2 (10)
        a <= '1'; b <= '0'; cin <= '0'; wait for 20 ns; -- 1+0+0 = 1
        a <= '1'; b <= '0'; cin <= '1'; wait for 20 ns; -- 1+0+1 = 2 (10)
        a <= '1'; b <= '1'; cin <= '0'; wait for 20 ns; -- 1+1+0 = 2 (10)
        a <= '1'; b <= '1'; cin <= '1'; wait for 20 ns; -- 1+1+1 = 3 (11)

        wait;
    end process;

end Behavioral;