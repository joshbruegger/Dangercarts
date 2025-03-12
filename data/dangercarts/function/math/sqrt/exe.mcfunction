##by NOPEname


#input:
# 		format:		scoreboard
#		objective: 	dc_math_sqrt
#		name: 		in

#calc:	function math:sqrt/exe
#preserves input: yes

#output:
#		format: 	scoreboard
#		objective: 	dc_math_sqrt
#		name: 		out


scoreboard players operation out dc_math_sqrt = in dc_math_sqrt
scoreboard players set tmp dc_math_sqrt 1

execute if score out dc_math_sqrt > tmp dc_math_sqrt run function dangercarts:math/sqrt/private/loop