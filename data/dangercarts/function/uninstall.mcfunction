# Remove all scoreboard objectives
scoreboard objectives remove dc_motion_x
scoreboard objectives remove dc_motion_y
scoreboard objectives remove dc_motion_z
scoreboard objectives remove dc_motion_sum
scoreboard objectives remove dc_motion_after
scoreboard objectives remove dc_low
scoreboard objectives remove dc_medium
scoreboard objectives remove dc_high
scoreboard objectives remove dc_low_damage
scoreboard objectives remove dc_medium_damage
scoreboard objectives remove dc_high_damage
scoreboard objectives remove dc_num

# Math library
scoreboard objectives remove dc_math_sqrt

# Remove all data storage
data remove storage dangercarts:config dc_low_damage
data remove storage dangercarts:config dc_medium_damage
data remove storage dangercarts:config dc_high_damage
data remove storage dangercarts:config dc_low
data remove storage dangercarts:config dc_medium
data remove storage dangercarts:config dc_high

# Kill any entities with custom tags created by this datapack
kill @e[tag=dc_slime]

# Display uninstall message
tellraw @a {"text":"Dangercarts Datapack has been uninstalled","color":"red", "bold": true}
tellraw @a ["",{"text":"Please disable it using ","color":"gold"},{"text":"/datapack disable","color":"red"},{"text":" or remove it from the datapacks folder before restarting the world/server","color":"gold"}]
