library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_HalfAdder is
-- Testbench entity'si boş olur, dışarıdan portu yoktur.
end tb_HalfAdder;

architecture Behavioral of tb_HalfAdder is

    -- 1. Test edilecek bileşeni (UUT) çağırıyoruz
    component HalfAdder
    Port(
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : out STD_LOGIC_VECTOR(1 downto 0)
    );
end component;

    -- 2. Girişleri ve Çıkışları bağlamak için sinyaller
signal a : STD_LOGIC := '0';
signal b : STD_LOGIC := '0';
signal c : STD_LOGIC_VECTOR(1 downto 0);

begin

    -- 3. Port Haritalama (Mapping)
    uut: HalfAdder PORT MAP (
        a => a,
        b => b,
        c => c
    );

    -- 4. Simülasyon Senaryosu (Stimulus Process)
    stim_proc: process
    begin
        -- Başlangıçta biraz bekle
        wait for 100 ns;

        -- Durum 1: 0 + 0 = 00
        a <= '0'; b <= '0';
        wait for 20 ns;

        -- Durum 2: 0 + 1 = 01
        a <= '0'; b <= '1';
        wait for 20 ns;

        -- Durum 3: 1 + 0 = 01
        a <= '1'; b <= '0';
        wait for 20 ns;

        -- Durum 4: 1 + 1 = 10 (2 decimal)
        a <= '1'; b <= '1';
        wait for 20 ns;

        -- Simülasyonu bitir (sonsuz döngüden kaçınmak için wait)
        wait;
    end process;

end Behavioral;