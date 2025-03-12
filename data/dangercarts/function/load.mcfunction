scoreboard objectives add kc_motion_x dummy
scoreboard objectives add kc_motion_y dummy
scoreboard objectives add kc_motion_z dummy

scoreboard objectives add kc_motion_sum dummy
scoreboard objectives add kc_motion_after dummy


# scoreboard players set .neg_1 kc_motion_sum -1

scoreboard objectives add kc_low dummy
scoreboard objectives add kc_medium dummy
scoreboard objectives add kc_high dummy

scoreboard objectives add kc_low_damage dummy
scoreboard objectives add kc_medium_damage dummy
scoreboard objectives add kc_high_damage dummy

# Set default damage values
execute unless data storage dangercarts:config kc_low_damage run data modify storage dangercarts:config kc_low_damage set value {"value":6}
execute unless data storage dangercarts:config kc_medium_damage run data modify storage dangercarts:config kc_medium_damage set value {"value":12}
execute unless data storage dangercarts:config kc_high_damage run data modify storage dangercarts:config kc_high_damage set value {"value":40}

execute store result score kc.global kc_low_damage run data get storage dangercarts:config kc_low_damage.value
execute store result score kc.global kc_medium_damage run data get storage dangercarts:config kc_medium_damage.value
execute store result score kc.global kc_high_damage run data get storage dangercarts:config kc_high_damage.value

# Set default threshold values
execute unless data storage dangercarts:config kc_low run data modify storage dangercarts:config kc_low set value {"value": 560}
execute unless data storage dangercarts:config kc_medium run data modify storage dangercarts:config kc_medium set value {"value": 810}
execute unless data storage dangercarts:config kc_high run data modify storage dangercarts:config kc_high set value {"value": 1110}

execute store result score kc.global kc_low run data get storage dangercarts:config kc_low
execute store result score kc.global kc_medium run data get storage dangercarts:config kc_medium
execute store result score kc.global kc_high run data get storage dangercarts:config kc_high

# tellraw @p [{"text":"kc_low: ","color":"green"},{"score":{"name":"kc.global","objective":"kc_low"}},{"text":"\n","color":"gray"},{"text":"kc_medium: ","color":"green"},{"score":{"name":"kc.global","objective":"kc_medium"}},{"text":"\n","color":"gray"},{"text":"kc_high: ","color":"green"},{"score":{"name":"kc.global","objective":"kc_high"}}]

# scoreboard players set kc.global kc_medium 810
# scoreboard players set kc.global kc_high 1110

# scoreboard players set kc.global kc_low_damage 6
# scoreboard players set kc.global kc_medium_damage 12s
# scoreboard players set kc.global kc_high_damage 40

function dangercarts:math/setup