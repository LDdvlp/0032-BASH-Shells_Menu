# ROADMAP – 0032-BASH-Shells_Menu

## Vision

Un menu Shell simple mais construit comme un "vrai" projet logiciel :

- code propre (Bash)
- structure claire (bin/, lib/, tests/)
- qualité automatisée (make ci, GitHub Actions, SonarQube)
- releases versionnées (alpha, beta, stable)

## Versioning

Schéma : **SemVer** + suffixes pré-release :

- `v0.1.0-alpha.N` : versions en construction, tu es le seul utilisateur.
- `v0.2.0-beta.N` : versions testées par quelques personnes (bêta-testeurs).
- `v1.0.0` : première version stable que tu assumes comme "produit".

---

## Phase Alpha

### v0.1.0-alpha.1 (version actuelle)

Objectifs :

- [x] Créer l'arborescence minimale du projet (bin/, lib/, tests/, .github/workflows/).
- [x] Ajouter un script `bin/menu.sh` avec un menu simple.
- [x] Ajouter un `Makefile` minimal (`lint`, `test`, `ci`).
- [x] Ajouter un premier test BATS.
- [x] Ajouter une CI GitHub de base (`.github/workflows/ci.yml`).
- [x] Ajouter Dependabot pour suivre les GitHub Actions.

### v0.1.0-alpha.2 (idées futures)

Idées possibles :

- [ ] Factoriser des fonctions communes dans `lib/`.
- [ ] Ajouter plus d'options dans le menu.
- [ ] Ajouter d'autres tests BATS (comportement des options).
- [ ] Améliorer les messages d'erreur et l'ergonomie.

---

### v0.1.0-alpha.3

Objectifs :

- [x] Introduire une librairie Bash `lib/helpers.sh`.
- [x] Ajouter une option non interactive `--env` qui utilise la librairie.
- [ ] Ajouter une entrée de menu interactive pour afficher l'environnement (option future).

---

### v0.1.0-alpha.4 (version en cours)

Objectifs :

- [x] Améliorer le menu interactif avec de vraies options utiles.
- [x] Ajouter une entrée pour afficher l'environnement détecté.
- [x] Ajouter un test BATS pour le menu interactif.

---

## Phase Beta

### v0.2.0-beta.1

- [ ] Stabiliser le menu pour qu'il soit utilisable par d'autres.
- [ ] Documenter tous les cas d'usage dans le README.
- [ ] Ajouter SonarQube/SonarCloud comme étape obligatoire dans la CI.
- [ ] Collecter du feedback d'utilisateurs (bêta).

---

## Version stable 1.0.0

### v1.0.0

- [ ] Menu considéré comme stable.
- [ ] CI verte (lint, tests, SonarQube).
- [ ] Changelog propre, releases GitHub publiées.
- [ ] Prêt à être réutilisé comme "template" pour d'autres projets Bash.
