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

---

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

### v0.1.0-alpha.4

Objectifs :

- [x] Améliorer le menu interactif avec de vraies options utiles.
- [x] Ajouter une entrée pour afficher l'environnement détecté.
- [x] Ajouter un test BATS pour le menu interactif.

---

### v0.1.0-alpha.5 (version en cours)

Objectifs :

- [x] Ajouter un script `install.sh` pour installer le menu dans `$HOME/.menu-shells`.
- [x] Ajouter un test BATS basique pour `install.sh`.
- [x] Inclure `install.sh` dans le lint ShellCheck.

---

## Principe : Alpha vs Beta

Alpha (0.1.x)
→ explorer, structurer, installer, CI/CD, qualité, prototypes du menu

Beta (0.2.x)
→ stabiliser l’expérience utilisateur, fiabiliser le comportement, préparer une vraie v1.0.0 “produit”.

---

## Phase Beta – vers une 1.0.0 stable

À partir de la branche des versions `0.2.x`, l’objectif n’est plus seulement d’ajouter des briques,
mais de stabiliser le comportement et de rendre le menu réellement utilisable au quotidien.

### v0.2.0-beta.1 – Beta initiale (stabilisation du cœur)

Objectifs :

- [ ] Figer la structure du menu principal :
  - sections claires (Systèmes, Réseaux, Outils, Divers, Quitter),
  - éviter de changer l’ergonomie d’une version à l’autre.
- [ ] Améliorer la gestion des erreurs :
  - messages d’erreur cohérents,
  - codes de retour explicites (0 = OK, ≠0 = erreur).
- [ ] Ajouter une option `--config` :
  - lire éventuellement un fichier de configuration (ex. `~/.menu-shells/config`),
  - préparer la possibilité de personnaliser certains éléments du menu.
- [ ] Documenter clairement dans le README :
  - comment installer (`install.sh`),
  - comment lancer (`smenu` ou `~/.menu-shells/menu.sh`),
  - ce que fait la Beta (et ce qu’elle ne fait pas encore).

### v0.2.0-beta.2 – Beta “utilisable au quotidien”

Objectifs :

- [ ] Ajouter quelques entrées de menu réellement utiles au quotidien :
  - ex. afficher l’IP locale,
  - ex. afficher l’espace disque,
  - ex. afficher les infos système de base.
- [ ] Ajouter des tests BATS pour ces nouvelles entrées.
- [ ] Vérifier le comportement dans différents environnements :
  - Git Bash,
  - WSL,
  - Linux “classique”.
- [ ] Nettoyer les TODOs et commentaires obsolètes dans le code.

### Objectif final : v1.0.0

- [ ] CI/CD stables (CI, release, SonarCloud, badges).
- [ ] `install.sh` stable (installation simple, idempotente, éventuellement uninstall).
- [ ] Menu principal stable et documenté.
- [ ] Jeu de tests BATS suffisant pour éviter les régressions majeures.
