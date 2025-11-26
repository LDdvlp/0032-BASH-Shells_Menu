#!/usr/bin/env bash
# 0032-BASH-Shells_Menu - menu principal
# Version : 0.1.0-alpha.1

set -euo pipefail

PROJECT_NAME="0032-BASH-Shells_Menu"
PROJECT_VERSION="0.1.0-alpha.2"

show_header() {
  clear || true
  cat <<EOF
$PROJECT_NAME - v$PROJECT_VERSION
================================

EOF
}

show_menu() {
  cat <<'EOF'
1) Afficher un message de bienvenue
2) Afficher la version
q) Quitter

Choix :
EOF
}

handle_choice() {
  local choice="$1"

  case "$choice" in
    1)
      echo "Bienvenue dans le Shells Menu (version $PROJECT_VERSION)"
      ;;
    2)
      echo "Version actuelle : $PROJECT_VERSION"
      ;;
    q|Q)
      echo "Au revoir !"
      exit 0
      ;;
    *)
      echo "Choix invalide."
      ;;
  esac
}

# Mode non interactif pour les tests : --version / --help
handle_cli_args() {
  local arg="${1-}"

  case "$arg" in
    --version)
      echo "$PROJECT_VERSION"
      exit 0
      ;;
    --help|-h)
      echo "$PROJECT_NAME - v$PROJECT_VERSION"
      echo "Usage :"
      echo "  bin/menu.sh         # mode interactif"
      echo "  bin/menu.sh --help  # afficher cette aide"
      echo "  bin/menu.sh --version # afficher la version"
      exit 0
      ;;
  esac
}

main() {
  # Si un argument est passé (mode test / non interactif)
  if [[ $# -gt 0 ]]; then
    handle_cli_args "$1"
  fi

  # Mode interactif
  while true; do
    show_header
    show_menu

    # read -p ne marche pas partout, on fait simple
    read -r choice

    handle_choice "$choice"

    echo
    read -rp "Appuie sur Entrée pour continuer..." _
  done
}

main "$@"
