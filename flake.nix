{
  description = "PltcalBlock";
  nixConfig.bash-prompt = "[nix(my-project)] ";
  inputs = {nixpkgs.url = "github:nixos/nixpkgs/23.05";};

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
    fooScript = pkgs.writeScriptBin "foo.sh" ''
      #!/bin/sh
      echo $FOO
    '';
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      name = "My-project build environment";
      buildInputs = with pkgs; [
        nodejs_20
        yarn
        git
      ];
      shellHook = ''
        echo "Welcome in $name"
      '';
    };
  };
}
