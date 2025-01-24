{
  description = "An R environment with Nix and tidyverse";

  inputs = {
	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = { self, nixpkgs }:
  let
	pkgs = import nixpkgs {
  	system = "x86_64-linux";
	};
  in
  {
	devShells.x86_64-linux.default = pkgs.mkShell {
  	buildInputs = with pkgs; [
    	R
        vscodium
        
	# Compatability package for VS Code
        rPackages.languageserver

	# Data Wrangling
    	rPackages.tidyverse

  	];

  	shellHook = ''
  	echo "R environment is ready."
  	'';
	};
  };
}


