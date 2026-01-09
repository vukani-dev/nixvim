# NixVim Configuration

A fast, batteries-included Neovim configuration using NixVim. Works on any system with Nix installed (Linux, macOS, WSL).

## Features

### Performance Optimized
- Byte-compiled Lua (~3x faster startup)
- Lazy loading with lz.n
- Big file handling with snacks.nvim
- Disabled unused providers (Node, Ruby, Perl)

### UI & Navigation
- OneDark theme
- Custom dashboard with quick actions
- File explorer with Oil
- Fuzzy finding with FZF
- Quick jump with Hop
- Git integration (LazyGit, Gitsigns)
- Notifications with nvim-notify and noice.nvim

### Language Support
| Language | LSP | Formatter |
|----------|-----|-----------|
| Nix | nixd | alejandra |
| TypeScript/JavaScript | ts_ls, eslint | prettier |
| Python | ruff | ruff_format |
| Rust | rust-analyzer (rustaceanvim) | rustfmt |
| Terraform/OpenTofu | terraformls | tofu_fmt |
| YAML | yamlls | yamlfmt |
| JSON | jsonls | prettier |
| Markdown | marksman | prettier |
| Svelte | svelte | prettier |
| Docker | dockerls | - |
| Helm | helm_ls | - |
| Lua | - | stylua |

### Completion & Diagnostics
- nvim-cmp with LSP, buffer, and path sources
- Treesitter for syntax highlighting
- Trouble for diagnostics list
- Todo-comments highlighting

## Installation

### Quick Run (Any Nix System)

```bash
# Run directly without installing
nix run github:vukani-dev/nixvim
```

### Add to Flake (Recommended)

Add to your `flake.nix` inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:vukani-dev/nixvim";
  };

  outputs = { nixpkgs, nixvim, ... }: {
    # Use as a package
    packages.x86_64-linux.default = nixvim.packages.x86_64-linux.default;

    # Or add to your home-manager/system config
  };
}
```

### Home Manager Integration

```nix
{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
```

### NixOS/nix-darwin System Config

```nix
{ inputs, pkgs, ... }: {
  environment.systemPackages = [
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
```

### Standalone Install (Without Flakes)

```bash
# Clone and build
git clone https://github.com/vukani-dev/nixvim.git
cd nixvim
nix build

# Run the built result
./result/bin/nvim

# Or install to profile
nix profile install .
```

## Supported Systems

- `x86_64-linux` (Linux)
- `aarch64-linux` (Linux ARM)
- `x86_64-darwin` (macOS Intel)
- `aarch64-darwin` (macOS Apple Silicon)

## Key Bindings

`<Space>` is the leader key.

| Key | Action |
|-----|--------|
| `jk` / `<ESC>` | Exit insert mode, clear search |
| `<leader>ff` | Find files |
| `<leader>/` | Live grep |
| `<leader>e` | File explorer (Oil) |
| `<leader>gg` | LazyGit |
| `m` | Hop (quick jump) |
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>ca` | Code actions |
| `<leader>cr` | Rename symbol |

See `configs/base/keys.nix` for complete keybindings.

## Project Structure

```
.
├── flake.nix              # Flake definition
├── configs/
│   ├── default.nix        # Root config with performance settings
│   └── base/
│       ├── dashboard.nix  # Alpha dashboard
│       ├── keys.nix       # Key mappings
│       ├── lang.nix       # LSP, formatters, completion
│       ├── options.nix    # Vim options
│       ├── plugins.nix    # General plugins
│       ├── search.nix     # FZF configuration
│       └── themes.nix     # Color scheme
```

## Customization

Fork this repo and modify the configs to suit your needs. The modular structure makes it easy to add or remove features.

To test changes locally:

```bash
nix build && ./result/bin/nvim
```
