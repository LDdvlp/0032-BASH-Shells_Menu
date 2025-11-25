# 0032-BASH-Shells_Menu

Petit projet d'exemple pour apprendre à :

- organiser un projet Bash proprement (bin/, lib/, tests/)
- écrire un menu Shell simple
- utiliser `make ci` en local (lint + tests)
- brancher une CI GitHub moderne (GitHub Actions, Dependabot, SonarQube, Releases)

## Prérequis

En local, il est recommandé d'avoir :

- Bash (Git Bash ou WSL)
- `make`
- `shellcheck`
- `bats` (Bash Automated Testing System)

## Commandes principales

```bash
# Lancer les vérifications locales (lint + tests)
make ci

# Lancer uniquement le lint (ShellCheck)
make lint

# Lancer uniquement les tests (BATS)
make test

# Lancer le menu
bin/menu.sh
