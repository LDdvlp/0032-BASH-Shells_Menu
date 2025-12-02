#!/usr/bin/env bats

@test "menu --version affiche la version et sort en 0" {
  run bash bin/menu.sh --version
  [ "$status" -eq 0 ]
  [[ "$output" =~ 0.1.0-alpha.5 ]]

}

@test "menu --help affiche un texte d'aide" {
  run bash bin/menu.sh --help
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Usage" ]]
}

@test "menu --env affiche un environnement non vide et sort en 0" {
  run bash bin/menu.sh --env
  [ "$status" -eq 0 ]
  [[ "$output" =~ "Environnement détecté :" ]]
}

@test "menu interactif permet d'afficher l'environnement puis de quitter" {
  run bash bin/menu.sh <<EOF
3
0
EOF

  [ "$status" -eq 0 ]
  [[ "$output" =~ "Environnement détecté :" ]]
}
