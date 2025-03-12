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
scoreboard objectives add kc_num dummy

# Set constants
scoreboard players set kc.global.1 kc_num 1
scoreboard players set kc.global.2 kc_num 2 
scoreboard players set kc.global.100 kc_num 100

# Set default damage values
execute unless data storage dangercarts:config kc_low_damage run data modify storage dangercarts:config kc_low_damage set value {"value":2}
execute unless data storage dangercarts:config kc_medium_damage run data modify storage dangercarts:config kc_medium_damage set value {"value":4}
execute unless data storage dangercarts:config kc_high_damage run data modify storage dangercarts:config kc_high_damage set value {"value":7}

# Set default threshold values
execute unless data storage dangercarts:config kc_low run data modify storage dangercarts:config kc_low set value {"value": 2}
execute unless data storage dangercarts:config kc_medium run data modify storage dangercarts:config kc_medium set value {"value": 4}
execute unless data storage dangercarts:config kc_high run data modify storage dangercarts:config kc_high set value {"value": 8}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

function dangercarts:math/setup