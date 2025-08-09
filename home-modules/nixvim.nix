{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    plugins.lsp.enable = true;
    plugins.cmp.enable = true;

    plugins.lsp.servers.nil_ls.enable = true;

    colorschemes.gruvbox.enable = true;
    colorschemes.gruvbox.settings.transparent_background = true;
    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      which-key.enable = true;
      web-devicons.enable = true;

      nvim-tree.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          noremap = true;
          silent = true;
          desc = "Toggle file explorer";
        };
      }
    ];

    extraConfigLua = ''
      vim.opt.relativenumber = true
      vim.opt.number = true
      vim.opt.clipboard = 'unnamedplus'
    '';
  };
}

