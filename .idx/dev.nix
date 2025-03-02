{ pkgs, ... }: {
  channel = "stable-24.05";

  packages = [
    pkgs.nodejs_20 # Use Node.js 18 for better compatibility
    pkgs.pnpm      # Explicitly include pnpm
  ];

  env = {
    PORT = "3000";
  };

  idx = {
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["pnpm" "start"];
          manager = "web";
          env = {
            PORT = "$PORT";
          };
        };
      };
    };

    workspace = {
      onCreate = {
        setup = ''
          pnpm i
        '';
      };
    };
  };
}