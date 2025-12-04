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

load_common_shell() {
  # 1) Si COMMON_SHELL_ROOT est déjà défini et valide, on le respecte
  if [ -n "${COMMON_SHELL_ROOT-}" ] && [ -f "$COMMON_SHELL_ROOT/lib/loader.sh" ]; then
    # shellcheck source=/dev/null
    . "$COMMON_SHELL_ROOT/lib/loader.sh"
    return 0
  fi

  # 2) Détection automatique suivant l’environnement
  if [ -d "/d/General/04-DocumentRoot/0-document_root/0033-BASH-Common_Shell" ]; then
    COMMON_SHELL_ROOT="/d/General/04-DocumentRoot/0-document_root/0033-BASH-Common_Shell"
  elif [ -d "/mnt/d/General/04-DocumentRoot/0-document_root/0033-BASH-Common_Shell" ]; then
    COMMON_SHELL_ROOT="/mnt/d/General/04-DocumentRoot/0-document_root/0033-BASH-Common_Shell"
  fi

  # 3) Si on a trouvé un chemin valide, on source loader.sh
  if [ -n "${COMMON_SHELL_ROOT-}" ] && [ -f "$COMMON_SHELL_ROOT/lib/loader.sh" ]; then
    export COMMON_SHELL_ROOT
    # shellcheck source=/dev/null
    . "$COMMON_SHELL_ROOT/lib/loader.sh"
    return 0
  fi

  # 4) Sinon, on log et on continue sans Common Shell
  echo "[$PROJECT_NAME] Common Shell non trouvé, démarrage sans framework commun." >&2
  return 1
}