scoreboard objectives add dc_motion_x dummy
scoreboard objectives add dc_motion_y dummy
scoreboard objectives add dc_motion_z dummy

scoreboard objectives add dc_motion_sum dummy
scoreboard objectives add dc_motion_after dummy


# scoreboard players set .neg_1 dc_motion_sum -1

scoreboard objectives add dc_low dummy
scoreboard objectives add dc_medium dummy
scoreboard objectives add dc_high dummy

scoreboard objectives add dc_low_damage dummy
scoreboard objectives add dc_medium_damage dummy
scoreboard objectives add dc_high_damage dummy
scoreboard objectives add dc_num dummy

# Set constants
scoreboard players set dc.vars.1 dc_num 1
scoreboard players set dc.vars.2 dc_num 2 
scoreboard players set dc.vars.100 dc_num 100

# Set default damage values
execute unless data storage dangercarts:config dc_low_damage run data modify storage dangercarts:config dc_low_damage set value {"value":2}
execute unless data storage dangercarts:config dc_medium_damage run data modify storage dangercarts:config dc_medium_damage set value {"value":4}
execute unless data storage dangercarts:config dc_high_damage run data modify storage dangercarts:config dc_high_damage set value {"value":7}

# Set default threshold values
execute unless data storage dangercarts:config dc_low run data modify storage dangercarts:config dc_low set value {"value": 2}
execute unless data storage dangercarts:config dc_medium run data modify storage dangercarts:config dc_medium set value {"value": 4}
execute unless data storage dangercarts:config dc_high run data modify storage dangercarts:config dc_high set value {"value": 6}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

function dangercarts:math/setup