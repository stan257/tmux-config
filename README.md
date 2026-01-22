# Tmux Power-User Configuration

My tmux setup designed for quantitative workflows.
Features **Ctrl+a** prefix, **Vim-navigation** integration, and **mouse support**.

## Installation

Requirements: tmux 3.2+ and `tmuxp` (for session layouts). The tmuxp layouts expect `nvim`, `ipython`, `lazygit`, and `btop` to be available.

### 1. Clone the repository
```bash
git clone https://github.com/stan257/tmux-config.git ~/tmux-config
```

### 2. Run the setup script
```bash
cd ~/tmux-config
chmod +x setup.sh
./setup.sh
```

### 3. Install Plugins
This config relies on the Tmux Plugin Manager (TPM). It is installed by the script, but you must trigger the plugin download manually:
1. Launch tmux: `tmux`
2. Press **`Ctrl + a`** (Release keys)
3. Press **`I`** (Shift + i)
4. Wait for the "Environment restored" message.

---

## Session Management (tmuxp)

This configuration includes **tmuxp** layouts for reproducible sessions.
Layouts are located in the `tmuxp/` directory and symlinked to `~/.config/tmuxp/` by the dotfiles installer.

### Usage
```bash
# Load the 'code' session (Research & Dev)
tmuxp load code

# Load the 'ops' session (Monitoring & Git)
tmuxp load ops
```

---

## Cheat Sheet

### **Core**
| Action | Binding | Note |
| :--- | :--- | :--- |
| **Prefix** | `Ctrl + a` | Replaces default `Ctrl+b` |
| **Reload Config** | `Prefix + r` | Instant update after changes |
| **Install Plugins** | `Prefix + I` | Downloads new plugins |

### **Pane Management**
| Action | Binding | Note |
| :--- | :--- | :--- |
| **Split Horizontal** | `Prefix + |` | (Requires Shift) |
| **Split Vertical** | `Prefix + -` | |
| **Kill Pane** | `Prefix + x` | No confirmation needed |
| **Zoom Pane** | `Prefix + z` | Toggle fullscreen |
| **New Window** | `Prefix + c` | Creates a new tab |
| **Rename Window** | `Prefix + ,` | |

### **Navigation (Turbo Mode)**
*Seamlessly move between panes without the Prefix.*
| Direction | Binding |
| :--- | :--- |
| **Left** | `Ctrl + h` |
| **Down** | `Ctrl + j` |
| **Up** | `Ctrl + k` |
| **Right** | `Ctrl + l` |
| **Clear Screen** | `Prefix + Ctrl + l` | (Since `Ctrl+l` is taken) |

### **Copy Mode (Vim Style)**
1. Enter mode: `Prefix + [`
2. Select text: `v` (Visual selection)
3. Block selection: `Ctrl + v` (Rectangle toggle)
4. Yank text: `y` (Copies to system clipboard)
5. Exit: `q` or `Esc`

## Troubleshooting

**"Ctrl+a isn't working"**
* You might still be on the old config. Run `tmux source ~/.tmux.conf` or kill the server with `tmux kill-server`.

**"Navigation keys (Ctrl+h/j/k/l) print characters instead of moving"**
* You haven't installed the plugins yet. Run the "Install Plugins" step above.

**"The status bar has weird boxes"**
* You need a Nerd Font.
* **Mac:** `brew install --cask font-jetbrains-mono-nerd-font` and set it in iTerm2.
* **Linux:** Ensure your terminal emulator supports Nerd Fonts.
