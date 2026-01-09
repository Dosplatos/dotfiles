# Overview

My opinionated set of dotfiles.

At the moment, this repo only tracks:

- .bashrc
- modular Bash configuration files under my .bashrc.d/
- hyprland DE .conf files

The goal *currently* is **not** to impose a full environment, but to provide a clean structure that others can:


- adopt/cherry pick what is needed
- selectively copy from and adapt to your own setup
- *TODO: quickly get some essential (opinionated) packages installed*

That said, this is primarily for myself to pull into work/other environments.

## Design

### .bashrc

Configuration is split into ordered modules in:

`~/.bashrc.d/`

Each module is a small, focused shell script. A lot are just configurations that get pulled into the .bashrc.

### Module Layout + Order

```
.bashrc.d/
├── 20-colors.sh
├── 30-aliases.sh
├── 40-functions.sh
├── 50-paths.sh
├── 60-vi-mode.sh
└── 70-ps1.sh
```

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

### hyprland

These definitely cannot be adopted as-is. For example, the monitor settings only work for a couple specific workstations that match the hardware, resolution, and physical layout. Config files for this are separated by concerns, so you would need to go into each and edit/remove the configs that would not work in your environment. [See the hyprland wiki](https://wiki.hypr.land/0.53.0/Getting-Started/) for how to get this set up.

Syntax is using the latest release of 0.53.0 for Jan 2026, and updated per-release (never latest-git).

