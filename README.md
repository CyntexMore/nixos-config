# nixos-config

This is my *highly sophisticated* NixOS configuration. It's highly tailored towards me and my hardware, so you might want to change a lot of stuff.

## Building

Replace `hardware-configuration.nix` with your own from `/etc/nixos`.

There are two scripts provided: `./rebuild.sh`, which rebuilds the entire system configuration, including home-manager stuff; and there's `./home.sh`, which only rebuilds the home-manager configuration and doesn't touch the system config.

