library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
        B : in  STD_LOGIC_VECTOR (3 downto 0);
        C : out STD_LOGIC_VECTOR (4 downto 0)); -- 5-bit Output
end RippleCarryAdder;

-- Structural Modeling
architecture Structural of RippleCarryAdder is

    -- Component Tanımları
    component HalfAdder
    Port ( a : in STD_LOGIC;
        b : in STD_LOGIC;
        c : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component FullAdder
Port ( a : in STD_LOGIC;
    b : in STD_LOGIC;
    c : in STD_LOGIC;
    d : out STD_LOGIC_VECTOR (1 downto 0));
end component;

    -- Ara elde sinyalleri (Carry signals)
signal c1, c2, c3 : STD_LOGIC;

    -- Component çıkışlarını eşleştirmek için geçici sinyaller
    -- HA çıkışı 2 bit, FA çıkışı 2 bit olduğu için port map'te
    -- direkt bit seçimi yaparak bağlayacağız.

begin

    -- Bit 0 (LSB): Half Adder kullanılır (Giriş Eldesi yok)
    HA_0: HalfAdder port map (
        a => A(0),
        b => B(0),
        c(0) => C(0), -- Sum bit 0
        c(1) => c1    -- Carry out 0 -> Carry in 1
    );

    -- Bit 1: Full Adder
    FA_1: FullAdder port map (
        a => A(1),
        b => B(1),
        c => c1,
        d(0) => C(1), -- Sum bit 1
        d(1) => c2    -- Carry out 1 -> Carry in 2
    );

    -- Bit 2: Full Adder
    FA_2: FullAdder port map (
        a => A(2),
        b => B(2),
        c => c2,
        d(0) => C(2), -- Sum bit 2
        d(1) => c3    -- Carry out 2 -> Carry in 3
    );

    -- Bit 3 (MSB): Full Adder
    FA_3: FullAdder port map (
        a => A(3),
        b => B(3),
        c => c3,
        d(0) => C(3), -- Sum bit 3
        d(1) => C(4)  -- Son Elde -> Output'un 5. biti (MSB)
    );

end Structural;