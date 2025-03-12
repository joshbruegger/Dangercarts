execute as @e[tag=dc_slime,nbt={Age:2}] at @s run tp @s ~ -256 ~

execute as @e[type=#dangercarts:carts] at @s if entity @e[type=!#dangercarts:not_mob,distance=0..4] run function dangercarts:cart
