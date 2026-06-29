# BatmanWare

A WarioWare-style microgame collection built in Godot 4. Rush through quick platforming and clicking challenges before time runs out.

## Requirements

- [Godot 4.6](https://godotengine.org/download) (GL Compatibility renderer)

## How to run

1. Open this folder in Godot (`project.godot`).
2. Press **F5** or click **Run Project**.
3. Start from the title screen with **Start Game**.

## How to play

- **Platform levels** — Move with arrow keys, jump with **Space** / **Enter** (`ui_accept`). Collect all studs before the timer hits zero.
- **Click levels** — Click every stud on screen before time runs out.
- You start with **5 lives**. Fail a minigame and you lose a life.
- Beat all **8 minigames** to win. Run out of lives and it's game over.

## Game flow

```
Title → Timer screen (0.5s) → Minigame → Timer screen → … → Win screen
                              ↘ (fail) → Timer screen or Death screen
```

| Level | Type        | Goal              |
|-------|-------------|-------------------|
| 1     | Platforming | Collect 3 studs   |
| 2     | Clicking    | Click 7 studs     |
| 3     | Platforming | Collect 3 studs   |
| 4     | Clicking    | Click 6 studs     |
| 5     | Platforming | Collect 3 studs   |
| 6     | Clicking    | Click 5 studs     |
| 7     | Platforming | Collect 3 studs   |
| 8     | Clicking    | Click 8 studs     |

## Project structure

```
scenes/
  title_scene.tscn      # Main menu
  timer_screen.tscn     # Between-level countdown + hearts
  minigame_1.tscn       # Platform levels (1, 3, 5, 7)
  minigame_2.tscn       # Click levels (2, 4, 6, 8)
  win_screen.tscn       # Victory screen
  death_screen.tscn     # Game over screen
  platform_minigame.gd  # Shared logic for platform levels
  click_minigame.gd     # Shared logic for click levels
  studs.gd              # Collectible stud behavior
  player.tscn           # Player character
Global.gd               # Lives, level progress, reset
button.gd               # Clickable stud buttons
```

## Hackatime

This project includes the [Godot Super Wakatime](addons/godot_super-wakatime/) plugin for Hack Club events. Enable it under **Project → Project Settings → Plugins** and configure your API key to track editor time.

## License

See [LICENSE](LICENSE).
