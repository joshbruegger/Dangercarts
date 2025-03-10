execute as @e[tag=kc_slime,nbt={Age:2}] at @s run tp @s ~ -256 ~

execute as @e[type=#tf_killcart:carts] at @s if entity @e[type=!#tf_killcart:not_mob,distance=0..4] run function tf_killcart:cart
