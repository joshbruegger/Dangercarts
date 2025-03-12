# Dangercarts: Dangerous Minecarts

If a hunk of iron speeding down some tracks hits you, you'd expect some damage; however, you can stop minecarts going any speed with your body without any repercussions. This is _especially weird_ if you enabled the [Minecart Improvements experiment](https://minecraft.wiki/w/Minecart_Improvements), in which Minecarts can go super fast.

With this data pack, minecarts now deal damage and knockback based on their speed! If you get killed by one, the death message will appropriately say that you got "smashed by a fast minecart".

Damage and knockback are dealt to all entities that can take it, which has an added bonus of killing or knocking off mobs from your rails, making your minecart not stop as often.

## How does it work?

The data pack works by spawning an invisible slime named "_a fast minecart_" in front of the minecart when it should hit entities. Damage is then applied based on the speed of the Minecart as if it were a mace attack by our favourite invisible slime, _a fast minecart_.

Note: This datapack does not work in peaceful difficulty.

## Configuration

You can set the speed threshold (in blocks per second) and damage values (in half hearts) for each speed using the following commands. You can set damage to 40 for a sure instant kill.

| Setting              | Command                                                                 |
| -------------------- | ----------------------------------------------------------------------- |
| set_low_threshold    | `/function dangercarts:config/set_low_threshold {value: <newvalue>}`    |
| set_medium_threshold | `/function dangercarts:config/set_medium_threshold {value: <newvalue>}` |
| set_high_threshold   | `/function dangercarts:config/set_high_threshold {value: <newvalue>}`   |
| set_low_damage       | `/function dangercarts:config/set_low_damage {value: <newvalue>}`       |
| set_medium_damage    | `/function dangercarts:config/set_medium_damage {value: <newvalue>}`    |
| set_high_damage      | `/function dangercarts:config/set_high_damage {value: <newvalue>}`      |

### Presets

You can also use the following commands to set the values to some presets:

**Default**

```
/function dangercarts:config/preset_default
```

| Setting   | High | Medium | Low |
| --------- | ---- | ------ | --- |
| threshold | 6    | 4      | 2   |
| damage    | 7    | 4      | 2   |

**Improved Minecarts Experiment with minecartMaxSpeed set to 22+**

```
/function dangercarts:config/preset_improved_minecarts
```

| Setting   | High | Medium | Low |
| --------- | ---- | ------ | --- |
| threshold | 21   | 15     | 10  |
| damage    | 40   | 12     | 6   |

## Important Notes

- The datapack needs slimes to be able to spawn. This means that it **will not work in peaceful difficulty**.
- Damage is applied on top of the small damage dealt by the slime used to knockback entities.
- It seems like the maximum speed of a minecart is 47 blocks per second, even if you set it higher using `gamerule minecartMaxSpeed` using the new Minecart Improvements experiment.

## Uninstalling

To uninstall the datapack, run the following command:

```
/function dangercarts:uninstall
```

This will remove all the scoreboard objectives and data storage used by the datapack. After running this command, you should disable or remove the datapack using `/datapack disable` or manually removing it from the datapacks folder before restarting the world/server.

## Reporting an issue / Contributing

Please report issues and contribute to the project on the [Github page](https://github.com/joshbruegger/Dangerous-Minecarts).

## Credits

This data pack is an adaptation of [Deadly Minecarts](https://www.planetminecraft.com/data-pack/deadly-minecarts/) to make it work with versions 1.21.x, and with a few improvements sprinkled in. It also uses a square root function developed by [NOPENAME](https://github.com/NOPENAME).
