# NixVim Configuration

A modular Neovim configuration using NixVim and the Nix package manager. This configuration provides specialized environments for different programming languages and development workflows.

## Features

### Base Configuration

- Modern UI with OneDark theme
- Custom dashboard with ASCII art and quick actions
- Extensive LSP integration with inline hints and diagnostics
- Fuzzy finding with FZF for files, text, and Git operations
- Git integration with LazyGit and Gitsigns
- File navigation with Oil
- Advanced completion with nvim-cmp
- Syntax highlighting with Treesitter

### Language-Specific Configurations

#### Web Development

- TypeScript/JavaScript LSP with advanced inlay hints
- Svelte support
- Prettier formatting
- ESLint integration

#### Infrastructure as Code

- Terraform/OpenTofu support
- Docker
- Helm
- NGINX

#### Rust

- Rust Analyzer integration
- Clippy linting
- Advanced inlay hints for lifetimes
- Rustfmt formatting

#### Python

- Python LSP with multiple plugins:
  - Black formatting
  - Flake8 linting
  - isort
  - Various code quality tools

## Key Bindings

- `<Space>` is used as the leader key
- `jk` or `<ESC>` to exit insert mode and clear search highlighting
- `<leader>ff` - Find files in current directory
- `<leader>/` - Live grep in current directory
- `<leader>e` - Open file explorer (Oil)
- `<leader>gg` - Open LazyGit
- `m` - Quick jump with Hop
- `<leader>h` - Harpoon commands

See the keymaps in `configs/base/keys.nix` for a complete list of key bindings.

## Running the configuration

Default configuration

```bash
nix run github:vukani-dev/nixvim
```

Web development configuration

```bash
nix run github:vukani-dev/nixvim#web
```

You can also add this to your system configuration to use it as a module.
See [here](https://github.com/vukani-dev/dotfiles/blob/ed45db058315f03bdae65ffed3fa42637c58c29d/flake.nix#L37) for an example.
