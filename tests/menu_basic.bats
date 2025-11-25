#!/usr/bin/env bats

@test "menu --version affiche la version et sort en 0" {
  run bash bin/menu.sh --version
  [ "$status" -eq 0 ]
  [[ "$output" =~ 0.1.0-alpha.1 ]]
}

@test "menu --help affiche un texte d'aide" {
  run bash bin/menu.sh --help
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Usage" ]]
}
