#!/usr/bin/env bash
set -euo pipefail

PROJECT_NAME="0032-BASH-Shells_Menu"
INSTALL_DIR="${HOME}/.menu-shells"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

usage() {
  cat <<EOF
Usage: ./install.sh [options]

Installe ${PROJECT_NAME} dans : ${INSTALL_DIR}

Options :
  -h, --help    Affiche cette aide et quitte.

Comportement :
  - crée le répertoire ${INSTALL_DIR} s'il n'existe pas,
  - copie bin/menu.sh vers ${INSTALL_DIR}/menu.sh,
  - copie lib/helpers.sh vers ${INSTALL_DIR}/lib/helpers.sh,
  - rend ${INSTALL_DIR}/menu.sh exécutable.

Après installation, vous pouvez lancer le menu avec :
  ${INSTALL_DIR}/menu.sh

Pour créer un alias permanent "smenu", ajoutez par exemple à votre ~/.bashrc :
  alias smenu="${INSTALL_DIR}/menu.sh"
EOF
}

copy_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
}

main() {
  local arg="${1-}"

  case "$arg" in
    -h|--help)
      usage
      exit 0
      ;;
    "" )
      ;;
    *)
      echo "Option inconnue : $arg" >&2
      echo "Utilisez --help pour l'aide." >&2
      exit 1
      ;;
  esac

  echo "Installation de ${PROJECT_NAME} dans : ${INSTALL_DIR}"
  mkdir -p "${INSTALL_DIR}"

  copy_file "${SCRIPT_DIR}/bin/menu.sh" "${INSTALL_DIR}/menu.sh"
  copy_file "${SCRIPT_DIR}/lib/helpers.sh" "${INSTALL_DIR}/lib/helpers.sh"

  chmod +x "${INSTALL_DIR}/menu.sh"

  echo
  echo "Installation terminée ✅"
  echo
  echo "Vous pouvez lancer le menu avec :"
  echo "  ${INSTALL_DIR}/menu.sh"
  echo
  echo "Astuce : ajoutez cet alias à votre ~/.bashrc ou ~/.zshrc :"
  echo "  alias smenu=\"${INSTALL_DIR}/menu.sh\""
}

main "$@"
