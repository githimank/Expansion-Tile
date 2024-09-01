# Expansion Widgets Example

This Flutter project demonstrates custom implementations of expandable widgets, specifically `ExpansionTileWidget` and `UpwardExpansionTileWidget`. These widgets provide customizable expansion functionality, which can be used to expand or collapse content within a `Container` or similar UI element.

## Features

- **ExpansionTileWidget**: A customizable expansion tile widget that expands downward to reveal its child widgets.
- **UpwardExpansionTileWidget**: A unique expansion tile that expands upward with optional drag-to-close functionality.
- **Customizable Animations**: Both widgets allow for animation customization, including the duration of expansion and collapse animations.
- **Drag-to-Close**: The `UpwardExpansionTileWidget` can be optionally closed by dragging down on the expanded content.

## Project Structure

- `expansions_widgets.dart`: The main screen that demonstrates the usage of the `ExpansionTileWidget` and `UpwardExpansionTileWidget`.
- `expansion_tile_widget.dart`: The implementation of `ExpansionTileWidget` with customizable animation and expansion logic.
- `upward_expansion_tile_widget.dart`: The implementation of `UpwardExpansionTileWidget`, which expands upward and optionally supports drag-to-close functionality.

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/expansion_widgets_example.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd expansion_widgets_example
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Usage

The app showcases two examples of expansion widgets:
1. A downward expansion widget.
2. An upward expansion widget with drag-to-close enabled.

These widgets can be used in your Flutter projects where expandable content is needed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---