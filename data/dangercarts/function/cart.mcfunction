# AS AT ALL MINECARTS near crashable entity

execute store result score @s dc_motion_x run data get entity @s Motion[0] 1000
execute store result score @s dc_motion_y run data get entity @s Motion[1] 1000
execute store result score @s dc_motion_z run data get entity @s Motion[2] 1000

# Square the motion values
scoreboard players operation @s dc_motion_x *= @s dc_motion_x
scoreboard players operation @s dc_motion_y *= @s dc_motion_y
scoreboard players operation @s dc_motion_z *= @s dc_motion_z

# Sum the motion values
scoreboard players operation @s dc_motion_sum += @s dc_motion_x
scoreboard players operation @s dc_motion_sum += @s dc_motion_y
scoreboard players operation @s dc_motion_sum += @s dc_motion_z

# Calculate speed by taking the square root of the sum
scoreboard players operation in dc_math_sqrt = @s dc_motion_sum
function dangercarts:math/sqrt/exe

# Convert to m/s
scoreboard players operation out dc_math_sqrt *= dc.vars.2 dc_num
scoreboard players operation out dc_math_sqrt /= dc.vars.100 dc_num
scoreboard players operation out dc_math_sqrt -= dc.vars.1 dc_num

# If damange is needed and damage entity doesn't exist, spawn it under the world
execute if score out dc_math_sqrt > dc.vars dc_low run execute unless entity @e[tag=dc_actual_slime] run summon minecraft:arrow ~ -100 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Tags:["dc_actual_slime"],CustomName:'{"text":"a fast minecart"}'}

# high damage if speed is greater than high threshold
execute if score out dc_math_sqrt > dc.vars dc_high run execute as @s run function dangercarts:deal_damage with storage dangercarts:config dc_high_damage

# medium damage if speed is greater than medium threshold
execute if score out dc_math_sqrt > dc.vars dc_medium unless score out dc_math_sqrt > dc.vars dc_high run execute as @s run function dangercarts:deal_damage with storage dangercarts:config dc_medium_damage

# low damage if speed is greater than low threshold
execute if score out dc_math_sqrt > dc.vars dc_low unless score out dc_math_sqrt > dc.vars dc_medium run execute as @s run function dangercarts:deal_damage with storage dangercarts:config dc_low_damage

# Teleport away invisible slime
execute as @e[tag=dc_slime,nbt={Age:1}] at @s run tp @s ~ ~-320 ~

# tellraw @p [{"text":"Cart Speed: ","color":"gold"},{"score":{"name":"out","objective":"dc_math_sqrt"},"color":"yellow"}]
# tellraw @p [{"text":"High Damage Threshold: ","color":"dark_red"},{"score":{"name":"dc.vars","objective":"dc_high"},"color":"red"}]
# tellraw @p [{"text":"Medium Damage Threshold: ","color":"gold"},{"score":{"name":"dc.vars","objective":"dc_medium"},"color":"yellow"}]
# tellraw @p [{"text":"Low Damage Threshold: ","color":"green"},{"score":{"name":"dc.vars","objective":"dc_low"},"color":"aqua"}]

# Reset scoreboard values
scoreboard players reset @s dc_motion_sum
scoreboard players reset out dc_math_sqrt
