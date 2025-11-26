#!/usr/bin/env bash
# 0032-BASH-Shells_Menu - menu principal
# Version : 0.1.0-alpha.3

set -euo pipefail

PROJECT_NAME="0032-BASH-Shells_Menu"
PROJECT_VERSION="0.1.0-alpha.3"

# Déterminer le dossier racine du projet (un cran au-dessus de bin/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Indiquer à ShellCheck où se trouve le fichier source
# shellcheck source=../lib/helpers.sh
. "$SCRIPT_DIR/lib/helpers.sh"


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
      echo "  bin/menu.sh             # mode interactif"
      echo "  bin/menu.sh --help      # afficher cette aide"
      echo "  bin/menu.sh --version   # afficher la version"
      echo "  bin/menu.sh --ping      # test simple (retourne 0)"
      echo "  bin/menu.sh --env       # afficher l'environnement détecté"
      exit 0
      ;;
    --ping)
      echo "pong"
      exit 0
      ;;
    --env)
      echo "Environnement détecté : $(detect_env)"
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
