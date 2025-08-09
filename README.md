# nixos-config

This is my *highly sophisticated* NixOS configuration. It's highly tailored towards me and my hardware, so you might want to change a lot of stuff.

## Building

You can build and directly apply this config with:

```bash
$ sudo nixos-rebuild switch --flake .#nixos
```

You can also do `build-image`, or `build-vm`.
