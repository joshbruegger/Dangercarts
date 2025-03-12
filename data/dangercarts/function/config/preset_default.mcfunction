data modify storage dangercarts:config kc_low_damage set value {"value":2}
data modify storage dangercarts:config kc_medium_damage set value {"value":4}
data modify storage dangercarts:config kc_high_damage set value {"value":7}

data modify storage dangercarts:config kc_low set value {"value": 2}
data modify storage dangercarts:config kc_medium set value {"value": 4}
data modify storage dangercarts:config kc_high set value {"value": 8}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

# Print config
function dangercarts:config/print_config