{ pkgs, ... }:

let
  rocmPath = "/opt/rocm";
in
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";

    EDITOR = "nvim";
    
    ROCM_PATH = rocmPath;
    HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    HIPCC_FLAGS = "--amdgpu-target=gfx1100 --hip-link-llvm-bitcode";
  };

  home.sessionPath = [
    "${rocmPath}/bin"
  ];

  programs.fish.enable = true;
}
