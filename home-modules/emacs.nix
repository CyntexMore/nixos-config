{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

  home.file.".emacs.d/init.el".text = ''
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (tool-bar-mode -1)
    (tooltip-mode -1)

    (setq inhibit-startup-screen t
          ring-bell-function 'ignore
          visible-bell nil)
    
    (require 'package)
    (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                             ("gnu" . "https://elpa.gnu.org/packages/")))

    (package-initialize)
    (unless (package-installed-p 'evil)
      (package-refresh-contents)
      (package-install 'evil))
    (require 'evil)
    (evil-mode 1)

    (require 'org)
    (setq org-directory "~/org")
  '';
}

