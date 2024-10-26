{pkgs, ...}: {
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          terraform = ["tofu_fmt"];
          tf = ["tofu_fmt"];
        };
      };
    };
    lsp.servers = {
      dockerls.enable = true;
      helm_ls.enable = true;
      nginx_language_server.enable = true;
      terraformls.enable = true;
      # bicep.enable=true;
    };
  };
}
