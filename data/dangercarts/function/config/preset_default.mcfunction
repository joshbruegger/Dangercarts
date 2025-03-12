data modify storage dangercarts:config dc_low_damage set value {"value":2}
data modify storage dangercarts:config dc_medium_damage set value {"value":4}
data modify storage dangercarts:config dc_high_damage set value {"value":7}

data modify storage dangercarts:config dc_low set value {"value": 2}
data modify storage dangercarts:config dc_medium set value {"value": 4}
data modify storage dangercarts:config dc_high set value {"value": 6}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

# Print config
function dangercarts:config/print_config