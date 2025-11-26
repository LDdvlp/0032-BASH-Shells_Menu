#!/usr/bin/env bash
# Helpers pour 0032-BASH-Shells_Menu

# Détecte grossièrement l'environnement d'exécution
detect_env() {
  # WSL : Linux avec couche Microsoft
  if grep -qi "microsoft" /proc/version 2>/dev/null; then
    echo "WSL (Windows Subsystem for Linux)"
    return
  fi

  # Git Bash / Cygwin / MSYS
  if [[ "${OSTYPE-}" == msys* || "${OSTYPE-}" == cygwin* ]]; then
    echo "Git Bash / Windows"
    return
  fi

  # Par défaut, on considère un Unix/Linux classique
  echo "Unix / Linux"
}
