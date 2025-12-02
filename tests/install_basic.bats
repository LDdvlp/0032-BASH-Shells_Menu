#!/usr/bin/env bats

setup() {
  # On isole l'installation dans un faux HOME
  export ORIGINAL_HOME="$HOME"
  export HOME="$BATS_TMPDIR/home"
  mkdir -p "$HOME"
}

teardown() {
  export HOME="$ORIGINAL_HOME"
}

@test "install.sh --help affiche l'aide et sort en 0" {
  run bash install.sh --help

  [ "$status" -eq 0 ]
  [[ "$output" =~ "Usage:" ]]
  [[ "$output" =~ "install.sh" ]]
}

@test "install.sh installe le menu dans \$HOME/.menu-shells" {
  run bash install.sh

  [ "$status" -eq 0 ]
  [ -f "$HOME/.menu-shells/menu.sh" ]
  [ -f "$HOME/.menu-shells/lib/helpers.sh" ]
}
