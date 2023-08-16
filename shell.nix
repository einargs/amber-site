{ pkgs ? import <nixpkgs> {} }:

with pkgs;

# Using: https://matthewrhone.dev/jekyll-in-nixos
# Could not get it to properly work because of problems with
# platform specific builds messing with hashes. I figured out
# a way to tell bundler not to do that with
# `bundler config set --local force_ruby_platform false`.
# However, then I got a build error from sass complaining about not
# being able to build the platform specific version (which it needed
# TCP access for???). So we're just using normal bundler.

mkShell {
  nativeBuildInputs = [bundler ruby];
}

/*let env = bundlerEnv {
  name = "amber-site";
  inherit ruby;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset = ./gemset.nix;
}; in stdenv.mkDerivation {
  name = "amber-site";
  buildInputs = [env bundler ruby];
}*/
