#!/usr/bin/env bats

@test "menu --version affiche la version et sort en 0" {
  run bash bin/menu.sh --version
  [ "$status" -eq 0 ]

  # On récupère la version attendue depuis git, comme dans le script
  raw_version="$(git describe --tags --abbrev=0 2>/dev/null || echo 'dev')"
  expected_version="${raw_version#v}"

  [[ "$output" =~ "$expected_version" ]]
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

@test "menu outils fonctionne même sans Common Shell" {
  run bash bin/menu.sh <<EOF
5
0
EOF

  [ "$status" -eq 0 ]
  [[ "$output" =~ "Outils (Common Shell)" ]]
}
