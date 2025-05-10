# Tag passenger to prevent dealing damage to them
execute as @e[type=#dangercarts:carts] run execute on passengers run tag @s add dc_passenger

execute as @e[type=#dangercarts:carts] at @s if entity @e[type=!#dangercarts:not_mob,distance=0..4] run function dangercarts:cart

# Remove tag from passengers after processing
tag @e[tag=dc_passenger] remove dc_passenger

# Remove all damage entities
kill @e[tag=dc_actual_slime]
