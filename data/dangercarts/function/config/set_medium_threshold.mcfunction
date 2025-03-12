# Ran by player to set config values
# Use as /function dangercarts:set_medium_threshold {value: <newValue>}

$data modify storage dangercarts:config dc_medium set value {"value":$(value)}

# Load config values into scoreboard
function dangercarts:data_to_scoreboard

# Print config
function dangercarts:config/print_config