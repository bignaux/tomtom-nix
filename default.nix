{ pkgs ? import <nixpkgs> {} }:

rec {

  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  /* config = import (pkgs.path + "/nixos") {
    configuration = ./pkgs/sd-image-tomtom.nix;
  }; */

  linux_tomtom = pkgs.callPackage ./pkgs/linux_tomtom.nix {
    /* kernelPatches = with pkgs; [
      kernelPatches.bridge_stp_helper
      kernelPatches.request_key_helper
      kernelPatches.export_kernel_fpu_functions."5.3"
    ]; */
  };

  linuxPackages_tomtom = pkgs.linuxPackagesFor linux_tomtom;

  # todo : split packages with dev and package font
  microwindows = pkgs.callPackage ./pkgs/microwindows {};


  ttimage_tools = pkgs.callPackage ./pkgs/ttimage_tools {};

}
