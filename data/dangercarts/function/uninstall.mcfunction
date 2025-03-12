# Remove all scoreboard objectives
scoreboard objectives remove kc_motion_x
scoreboard objectives remove kc_motion_y
scoreboard objectives remove kc_motion_z
scoreboard objectives remove kc_motion_sum
scoreboard objectives remove kc_motion_after
scoreboard objectives remove kc_low
scoreboard objectives remove kc_medium
scoreboard objectives remove kc_high
scoreboard objectives remove kc_low_damage
scoreboard objectives remove kc_medium_damage
scoreboard objectives remove kc_high_damage
scoreboard objectives remove kc_num

# Math library
scoreboard objectives remove math_sqrt

# Remove all data storage
data remove storage dangercarts:config kc_low_damage
data remove storage dangercarts:config kc_medium_damage
data remove storage dangercarts:config kc_high_damage
data remove storage dangercarts:config kc_low
data remove storage dangercarts:config kc_medium
data remove storage dangercarts:config kc_high

# Kill any entities with custom tags created by this datapack
kill @e[tag=kc_slime]

# Display uninstall message
tellraw @a {"text":"Dangercarts Datapack has been uninstalled","color":"red", "bold": true}
tellraw @a ["",{"text":"Please disable it using ","color":"gold"},{"text":"/datapack disable","color":"red"},{"text":" or remove it from the datapacks folder before restarting the world/server","color":"gold"}]
