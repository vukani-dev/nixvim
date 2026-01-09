{ pkgs, ... }: {
  imports = [ ./base ];

  # Performance: byte compile lua for ~3x faster startup
  performance.byteCompileLua = {
    enable = true;
    nvimRuntime = true;
    configs = true;
    plugins = true;
  };

  # Disable unused providers
  withNodeJs = false;
  withRuby = false;
  withPerl = false;

  # Enable lazy loading
  plugins.lz-n.enable = true;
}