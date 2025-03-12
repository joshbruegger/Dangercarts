data modify storage dangercarts:config kc_low_damage set value {"value":6}
data modify storage dangercarts:config kc_medium_damage set value {"value":12}
data modify storage dangercarts:config kc_high_damage set value {"value":40}

data modify storage dangercarts:config kc_low set value {"value": 10}
data modify storage dangercarts:config kc_medium set value {"value": 15}
data modify storage dangercarts:config kc_high set value {"value": 21}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

# Print config
function dangercarts:config/print_config