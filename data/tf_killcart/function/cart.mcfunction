# AS AT ALL MINECARTS near crashable entity

execute store result score @s kc_motion_x run data get entity @s Motion[0] 1000
execute store result score @s kc_motion_y run data get entity @s Motion[1] 1000
execute store result score @s kc_motion_z run data get entity @s Motion[2] 1000

scoreboard players operation @s kc_motion_x *= @s kc_motion_x
scoreboard players operation @s kc_motion_y *= @s kc_motion_y
scoreboard players operation @s kc_motion_z *= @s kc_motion_z

scoreboard players operation @s kc_motion_sum += @s kc_motion_x
scoreboard players operation @s kc_motion_sum += @s kc_motion_y
scoreboard players operation @s kc_motion_sum += @s kc_motion_z

# NOPENAME's Square Root
scoreboard players operation in math_sqrt = @s kc_motion_sum
function tf_killcart:math/sqrt/exe

# tag passenger 
# execute if entity @s[nbt=!{Passengers:[]}] on passengers run tag @s add kc_passenger
execute on passengers run tag @s add kc_passenger


# Add kc_slime to the cart for knockback and death cause
execute if score out math_sqrt > kc.global kc_low as @e[type=!#tf_killcart:not_mob,distance=0..1.5,tag=!kc_passenger] run summon area_effect_cloud ~ ~320 ~ {Duration:3,Tags:["kc_slime"],Passengers:[{id:"minecraft:slime",Tags:["kc_actual_slime"],Silent:1b,Invulnerable:1b,Size:1,CustomName:'{"text":"a fast minecart"}',ActiveEffects:[{Id:14b,Amplifier:1b,Duration:999999,ShowParticles:0b}],Attributes:[{Name:generic.attack_damage,Base:0}]}]}


# high damage
# execute if score out math_sqrt > kc.global kc_high run damage @e[type=!#tf_killcart:not_mob,distance=0..1.5, limit=1,tag=!kc_passenger] 40 minecraft:mace_smash by @e[tag=kc_actual_slime,limit=1] from @e[tag=kc_actual_slime,limit=1]
execute if score out math_sqrt > kc.global kc_high run execute as @s run function tf_killcart:deal_damage with storage tf_killcart:config kc_high_damage



# medium damage
# execute if score out math_sqrt > kc.global kc_medium unless score out math_sqrt > kc.global kc_high run damage @e[type=!#tf_killcart:not_mob,distance=0..1.5, limit=1,tag=!kc_passenger] 12 minecraft:mace_smash by @e[tag=kc_actual_slime,limit=1] from @e[tag=kc_actual_slime,limit=1]
execute if score out math_sqrt > kc.global kc_medium unless score out math_sqrt > kc.global kc_high run execute as @s run function tf_killcart:deal_damage with storage tf_killcart:config kc_medium_damage


# low damage
# execute if score out math_sqrt > kc.global kc_low unless score out math_sqrt > kc.global kc_medium run damage @e[type=!#tf_killcart:not_mob,distance=0..1.5, limit=1,tag=!kc_passenger] 6 minecraft:mace_smash by @e[tag=kc_actual_slime,limit=1] from @e[tag=kc_actual_slime,limit=1]
execute if score out math_sqrt > kc.global kc_low unless score out math_sqrt > kc.global kc_medium run execute as @s run function tf_killcart:deal_damage with storage tf_killcart:config kc_low_damage




# execute as @s run function tf_killcart:deal_damage with storage tf_killcart:config kc_high_damage


# Teleport down INVISIBLE kc_slimee
execute as @e[tag=kc_slime,nbt={Age:1}] at @s run tp @s ~ ~-320 ~

# Remove kc_passenger tag after processing
tag @e[tag=kc_passenger] remove kc_passenger

scoreboard players reset @s kc_motion_sum
# tellraw @p {"score":{"name":"out","objective":"math_sqrt"}}
# scoreboard players reset out math_sqrt
