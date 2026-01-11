{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.dioxus-cli ];

  # https://devenv.sh/languages/
  languages.rust = {
    enable = true;
    # channel = "stable";
  };

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    hello
    ${lib.getExe pkgs.git} --version
    ${lib.getExe pkgs.rustc} --version
    ${lib.getExe pkgs.cargo} --version
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    ${lib.getExe pkgs.git} --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    rustfmt.enable = true;
    clippy.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
