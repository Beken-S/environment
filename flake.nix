{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    inputs.disko.url = "github:nix-community/disko/latest";
    inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

    outputs = { self, disko, nixpkgs }: {
        nixosConfigurations.mymachine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                disko.nixosModules.disko
                ./disko-config.nix
            ];
        };
    };
}
