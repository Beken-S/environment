{
    inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    inputs.disko.url = "github:nix-community/disko/latest";
    inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

    outputs = { self, disko, nixpkgs }: {
        nixosConfigurations.mymachine = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                disko.nixosModules.disko
                {
                    disko.devices = import ./disko-config.nix;
                }
            ];
        };
    };
}
