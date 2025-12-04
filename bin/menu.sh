#!/usr/bin/env bash
# 0032-BASH-Shells_Menu - menu principal
# Version : 0.1.0-alpha.3

set -euo pipefail

PROJECT_NAME="0032-BASH-Shells_Menu"
# Récupère la version depuis les tags git (fallback : dev)
PROJECT_VERSION="$(git describe --tags --abbrev=0 2>/dev/null || echo 'dev')"


# Déterminer le dossier racine du projet (un cran au-dessus de bin/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
load_common_shell || true

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
  echo "==============================="
  echo "  $PROJECT_NAME - v$PROJECT_VERSION"
  echo "==============================="
  echo "1) Afficher la version"
  echo "2) Ping (test simple)"
  echo "3) Afficher l'environnement détecté"
  echo "4) Outils (Common Shell)"
  echo "0) Quitter"
  echo
  printf "Votre choix : "
}


handle_choice() {
  local choice="${1-}"

  case "$choice" in
    1)
      echo
      echo "Version actuelle : v$PROJECT_VERSION"
      ;;
    2)
      echo
      echo "Ping..."
      echo "pong"
      ;;
    3)
      echo
      echo "Environnement détecté : $(detect_env)"
      ;;
    4)
      menu_tools
      ;;
    0)
      echo
      echo "Au revoir !"
      exit 0
      ;;
    *)
      echo
      echo "Choix invalide : '$choice'"
      ;;
  esac

  echo
  echo "Appuyez sur Entrée pour revenir au menu..."
  # shellcheck disable=SC2162
  read _ || true
}


# Mode non interactif pour les tests : --version / --help
handle_cli_args() {
  local arg="${1-}"

  case "$arg" in
    --version)
      echo "$PROJECT_NAME $PROJECT_VERSION"
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

menu_tools() {
  echo "-------------------------"
  echo "   Outils (Common Shell)"
  echo "-------------------------"

  # Si COMMON_SHELL_SCRIPTS n'est pas défini, on ne peut rien lancer
  if [ -z "${COMMON_SHELL_SCRIPTS-}" ]; then
    echo "Common Shell non disponible (COMMON_SHELL_SCRIPTS non défini)."
    echo "Assurez-vous que 0033-BASH-Common_Shell est installé et chargé."
    echo
    echo "Appuyez sur Entrée pour revenir au menu principal..."
    read -r _
    return 0
  fi

  echo "1) Infos système"
  echo "2) Espace disque"
  echo "3) IP locales"
  echo "4) Ping test (8.8.8.8)"
  echo "0) Retour au menu principal"
  echo
  printf "Votre choix (Outils) : "
  read -r tchoice

  case "$tchoice" in
    1)
      if [ -x "$COMMON_SHELL_SCRIPTS/system/sysinfo.sh" ]; then
        "$COMMON_SHELL_SCRIPTS/system/sysinfo.sh"
      else
        echo "Script sysinfo.sh introuvable."
      fi
      ;;
    2)
      if [ -x "$COMMON_SHELL_SCRIPTS/system/disk.sh" ]; then
        "$COMMON_SHELL_SCRIPTS/system/disk.sh"
      else
        echo "Script disk.sh introuvable."
      fi
      ;;
    3)
      if [ -x "$COMMON_SHELL_SCRIPTS/network/ip.sh" ]; then
        "$COMMON_SHELL_SCRIPTS/network/ip.sh"
      else
        echo "Script ip.sh introuvable."
      fi
      ;;
    4)
      if [ -x "$COMMON_SHELL_SCRIPTS/network/pingtest.sh" ]; then
        "$COMMON_SHELL_SCRIPTS/network/pingtest.sh"
      else
        echo "Script pingtest.sh introuvable."
      fi
      ;;
    0)
      echo "Retour au menu principal."
      ;;
    *)
      echo "Choix outil invalide."
      ;;
  esac

  echo
  echo "Appuyez sur Entrée pour revenir au menu Outils..."
  read -r _
}

main() {
  # Si un argument est passé (mode test / non interactif)
  if [[ $# -gt 0 ]]; then
    handle_cli_args "$1"
  fi

  # Mode interactif
  while true; do
    show_menu
    if ! read -r choice; then
      echo
      echo "Entrée interrompue, sortie du programme."
      exit 0
    fi
    handle_choice "$choice"
  done

}

main "$@"
