{
  description = "Cli tools for lean";

  inputs = {
    lean = {
      url = "github:leanprover/lean4";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, lean, flake-utils, nixpkgs }:
    let
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
        "i686-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      inherit (flake-utils) lib;
    in
    lib.eachSystem supportedSystems (system:
      let
        leanPkgs = lean.packages.${system};
        pkgs = nixpkgs.legacyPackages.${system};
        name = "Cli";  # must match the name of the top-level .lean file
        project = leanPkgs.buildLeanPackage {
          inherit name;
          # deps = [ lean-ipld.project.${system} ];
          # Where the lean files are located
          src = ./src;
        };
        example = leanPkgs.buildLeanPackage {
          name = "Cli.Example";
          deps = [ project ];
          # Where the lean files are located
          src = ./src;
        };
        test = leanPkgs.buildLeanPackage {
          name = "Tests";
          deps = [ project ];
          # Where the lean files are located
          src = ./test;
        };
        joinDepsDerivations = getSubDrv:
          pkgs.lib.concatStringsSep ":" (map (d: "${getSubDrv d}") (project.allExternalDeps));
      in
      {
        inherit project test;
        packages = project // {
          ${name} = project.sharedLib;
          example = example.executable;
          test = test.executable;
        };

        defaultPackage = self.packages.${system}.example;
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              elan
            ];
            LEAN_PATH = "./src:./test";
            LEAN_SRC_PATH = "./src:./test";
          };
          lean-dev = pkgs.mkShell {
            buildInputs = with pkgs; [
              leanPkgs.lean-dev
            ];
            LEAN_PATH = "./src:./test";
            LEAN_SRC_PATH = "./src:./test";
          };
        };
      });
}
