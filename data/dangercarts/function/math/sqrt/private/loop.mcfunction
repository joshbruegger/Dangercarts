##by NOPEname

scoreboard players operation out dc_math_sqrt += tmp dc_math_sqrt
scoreboard players operation out dc_math_sqrt /= 2 dc_math_sqrt

scoreboard players operation tmp dc_math_sqrt = in dc_math_sqrt
scoreboard players operation tmp dc_math_sqrt /= out dc_math_sqrt

execute if score out dc_math_sqrt > tmp dc_math_sqrt run function dangercarts:math/sqrt/private/loop