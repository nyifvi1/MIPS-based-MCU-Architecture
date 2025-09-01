library ieee;
use ieee.std_logic_1164.all;
-----------------------------------------------------------------
entity TriState is
	generic( width: integer:=32 );
	port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
			en:		in 		std_logic;
			IOpin: 	out 	std_logic_vector(width-1 downto 0));
end TriState;

architecture comb of TriState is
begin 

	IOpin <= Dout when(en='1') else (others => 'Z');
	
end comb;

