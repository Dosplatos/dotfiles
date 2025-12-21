# Overview

My opinionated set of dotfiles.

At the moment, this repo only tracks:

- .bashrc
- modular Bash configuration files under my .bashrc.d/

The goal is **not** to impose a full environment, but to provide a clean structure that others can:

This is primarily for myself to pull into work/other environments. With that said, you could just:

- adopt this wholesale
- selectively copy from and adapt to your own setup
- *TODO: quickly get some essential (opinionated) packages installed*

## Design

### .bashrc

Configuration is split into ordered modules in:

`~/.bashrc.d/`

Each module is a small, focused shell script. A lot are just configurations that get pulled into the .bashrc.

### Module Layout + Order

.bashrc.d/
├── 20-colors.sh
├── 30-aliases.sh
├── 40-functions.sh
├── 50-paths.sh
├── 60-vi-mode.sh
└── 70-ps1.sh

*The numbering matters*

Modules are loaded in filename order, so the numeric prefixes are intentional. Some modules depend on earlier ones. For example:

- color (20) definitions must exist before they are used by
  - custom scripts (40)
  - vi-mode status indicators (60)
  - PS1 (70)

If you keep the numeric prefixes as-is, everything should load just fine.

### Imortant Usage Note

If you want to use this as is, just make a backup of your current .bashrc just in case:

`mv ~/.bashrc ~/.bashrc.bak`

