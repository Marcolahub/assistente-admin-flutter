{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.flutter
    pkgs.jdk17
    pkgs.unzip
  ];

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "flutter run -d web-server --web-port $PORT --web-hostname 0.0.0.0"
        #   command = ["flutter" "run" "-d" "web-server" "--web-port" "$PORT" "--web-hostname" "0.0.0.0"];
        #   manager = "flutter";
        # };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
      };
    };
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Open editors for the following files by default, if they exist:
        default.openFiles = [ "lib/main.dart" ];
        # Ensure platform folders exist
        flutter-create = "flutter create --platforms web,android .";
      };
    };
  };
}