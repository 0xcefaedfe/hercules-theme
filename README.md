# Hercules Theme for Emacs

A minimalist theme for Emacs with warm amber/orange accents, inspired by the old Hercules monitors. Based on the gruber-darker theme.

## Features

- Two carefully crafted variants: dark and light
- Warm amber/orange accent colors
- Clear readability and minimalist design
- Support for many built-in and third-party packages
- Convenient theme switching functions

## Installation

### Via MELPA (when available)

```elisp
M-x package-install RET hercules-theme RET
```

### Manual Installation

1. Clone this repository or download the theme files
2. Add the theme directory to your `load-path`:

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/hercules-theme/")
```

## Usage

### Loading the Theme

To load the dark theme:
```elisp
(load-theme 'hercules t)
```

To load the light theme:
```elisp
(load-theme 'hercules-light t)
```

### Theme Switching Functions

The dark theme includes convenient functions for switching between variants:

```elisp
;; Select a specific variant
(hercules-select-theme 'dark)
(hercules-select-theme 'light)

;; Toggle between dark and light
(hercules-toggle-theme)
```

You can bind the toggle function to a key:
```elisp
(global-set-key (kbd "C-c t h") 'hercules-toggle-theme)
```

### Use with use-package

```elisp
(use-package hercules-theme
  :ensure t
  :config
  (load-theme 'hercules t)
  :bind ("C-c t h" . hercules-toggle-theme))
```

## Requirements

- Emacs 24.3 or higher
- For the light variant, you need both `hercules-theme.el` and `hercules-light-theme.el`

## Screenshots

### Dark Theme
![Dark Mode](screenshots/hercules-dark.png)

### Light Theme
![Light Mode](screenshots/hercules-light.png)

## License

This theme is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3, or (at your option) any later version.

See [LICENSE](LICENSE) for details.

## Credits

- Based on the gruber-darker theme
- Inspired by the classic amber Hercules monitors
