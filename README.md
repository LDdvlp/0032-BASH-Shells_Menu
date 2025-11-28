# 0032-BASH-Shells_Menu

[![CI](https://github.com/LDdvlp/0032-BASH-Shells_Menu/actions/workflows/ci.yml/badge.svg)](https://github.com/LDdvlp/0032-BASH-Shells_Menu/actions/workflows/ci.yml)
[![Release / CD](https://github.com/LDdvlp/0032-BASH-Shells_Menu/actions/workflows/release.yml/badge.svg)](https://github.com/LDdvlp/0032-BASH-Shells_Menu/actions/workflows/release.yml)
[![Latest Tag / Version](https://img.shields.io/github/v/tag/LDdvlp/0032-BASH-Shells_Menu?label=version)](https://github.com/LDdvlp/0032-BASH-Shells_Menu/tags)
[![GitHub Releases](https://img.shields.io/github/v/release/LDdvlp/0032-BASH-Shells_Menu?include_prereleases&label=release)](https://github.com/LDdvlp/0032-BASH-Shells_Menu/releases)
[![SonarCloud Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=LDdvlp_0032-BASH-Shells_Menu&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=LDdvlp_0032-BASH-Shells_Menu)


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

```

## Version

## Version

Version actuelle : `v0.1.0-alpha.3` (ajout de l’option `--env` et d'une librairie `lib/helpers.sh`).


### Historique rapide des versions

- `v0.1.0-alpha.2` – ajout de l’option `--ping`, mise à jour des tests
- `v0.1.0-alpha.1` – squelette minimal + menu simple + CI initiale