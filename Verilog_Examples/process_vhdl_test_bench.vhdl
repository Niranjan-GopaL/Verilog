library ieee;
use ieee.std_logic_1164.all;

entity tb_example_and is
  -- No ports in testbench
end tb_example_and;

architecture behavior of tb_example_and is
  -- Component Declaration for the Unit Under Test (UUT)
  component example_and
    port (
      input_1    : in  std_logic;
      input_2    : in  std_logic;
      and_result : out std_logic
    );
  end component;

  -- Testbench signals
  signal tb_input_1    : std_logic := '0';
  signal tb_input_2    : std_logic := '0';
  signal tb_and_result : std_logic;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut: example_and
    port map (
      input_1    => tb_input_1,
      input_2    => tb_input_2,
      and_result => tb_and_result
    );

  -- Test process to stimulate the inputs
  stim_proc: process
  begin
    -- Test case 1: both inputs are '0'
    tb_input_1 <= '0';
    tb_input_2 <= '0';
    wait for 10 ns;

    -- Test case 2: input_1 is '0', input_2 is '1'
    tb_input_1 <= '0';
    tb_input_2 <= '1';
    wait for 10 ns;

    -- Test case 3: input_1 is '1', input_2 is '0'
    tb_input_1 <= '1';
    tb_input_2 <= '0';
    wait for 10 ns;

    -- Test case 4: both inputs are '1'
    tb_input_1 <= '1';
    tb_input_2 <= '1';
    wait for 10 ns;

    -- End simulation
    wait;
  end process;

end behavior;