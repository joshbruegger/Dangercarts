# Ran by player to set config values
# Use as /function dangercarts:set_high_damage {value: <newValue>}

$data modify storage dangercarts:config dc_high_damage set value {"value":$(value)}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

# Print config
function dangercarts:config/print_config