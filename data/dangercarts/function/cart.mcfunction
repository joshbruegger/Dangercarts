# AS AT ALL MINECARTS near crashable entity

execute store result score @s kc_motion_x run data get entity @s Motion[0] 1000
execute store result score @s kc_motion_y run data get entity @s Motion[1] 1000
execute store result score @s kc_motion_z run data get entity @s Motion[2] 1000

# Square the motion values
scoreboard players operation @s kc_motion_x *= @s kc_motion_x
scoreboard players operation @s kc_motion_y *= @s kc_motion_y
scoreboard players operation @s kc_motion_z *= @s kc_motion_z

# Sum the motion values
scoreboard players operation @s kc_motion_sum += @s kc_motion_x
scoreboard players operation @s kc_motion_sum += @s kc_motion_y
scoreboard players operation @s kc_motion_sum += @s kc_motion_z

# Calculate speed by taking the square root of the sum
scoreboard players operation in math_sqrt = @s kc_motion_sum
function dangercarts:math/sqrt/exe

# Convert to m/s
scoreboard players operation out math_sqrt *= kc.global.2 kc_num
scoreboard players operation out math_sqrt /= kc.global.100 kc_num
scoreboard players operation out math_sqrt -= kc.global.1 kc_num

# Tag passenger to prevent dealing damage to them
execute on passengers run tag @s add kc_passenger

# Add named invisible slime to the cart for knockback and death cause
execute if score out math_sqrt > kc.global kc_low as @e[type=!#dangercarts:not_mob,distance=0..1.5,tag=!kc_passenger] run summon area_effect_cloud ~ ~320 ~ {Duration:3,Tags:["kc_slime"],Passengers:[{id:"minecraft:slime",Tags:["kc_actual_slime"],Silent:1b,Invulnerable:1b,Size:1,CustomName:'{"text":"a fast minecart"}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}],Attributes:[{Name:generic.attack_damage,Base:0}]}]}

# high damage if speed is greater than high threshold
execute if score out math_sqrt > kc.global kc_high run execute as @s run function dangercarts:deal_damage with storage dangercarts:config kc_high_damage

# medium damage if speed is greater than medium threshold
execute if score out math_sqrt > kc.global kc_medium unless score out math_sqrt > kc.global kc_high run execute as @s run function dangercarts:deal_damage with storage dangercarts:config kc_medium_damage

# low damage if speed is greater than low threshold
execute if score out math_sqrt > kc.global kc_low unless score out math_sqrt > kc.global kc_medium run execute as @s run function dangercarts:deal_damage with storage dangercarts:config kc_low_damage

# Teleport away invisible slime
execute as @e[tag=kc_slime,nbt={Age:1}] at @s run tp @s ~ ~-320 ~

# Remove tag from passengers after processing
tag @e[tag=kc_passenger] remove kc_passenger

# tellraw @p [{"text":"Cart Speed: ","color":"gold"},{"score":{"name":"out","objective":"math_sqrt"},"color":"yellow"}]
# tellraw @p [{"text":"High Damage Threshold: ","color":"dark_red"},{"score":{"name":"kc.global","objective":"kc_high"},"color":"red"}]
# tellraw @p [{"text":"Medium Damage Threshold: ","color":"gold"},{"score":{"name":"kc.global","objective":"kc_medium"},"color":"yellow"}]
# tellraw @p [{"text":"Low Damage Threshold: ","color":"green"},{"score":{"name":"kc.global","objective":"kc_low"},"color":"aqua"}]

# Reset scoreboard values
scoreboard players reset @s kc_motion_sum
scoreboard players reset out math_sqrt
