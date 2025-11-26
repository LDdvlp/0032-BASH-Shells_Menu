SHELL := /usr/bin/env bash

# Tous les scripts shell à analyser
SH_FILES := $(wildcard bin/*.sh lib/*.sh)

.PHONY: help lint test ci

help:
	@echo "Cibles disponibles :"
	@echo "  make lint   - Lancer ShellCheck sur les scripts"
	@echo "  make test   - Lancer les tests BATS"
	@echo "  make ci     - Lancer lint + tests"

lint:
	@echo "→ ShellCheck sur les scripts…"
	@if [ -z "$(SH_FILES)" ]; then \
	  echo "Aucun script *.sh trouvé dans bin/ ou lib/, lint ignoré."; \
	else \
	  echo "Fichiers analysés : $(SH_FILES)"; \
	  if command -v shellcheck >/dev/null 2>&1; then \
	    	    shellcheck -e SC1091 $(SH_FILES); \
	  else \
	    echo "ShellCheck n'est pas installé (commande 'shellcheck' introuvable)"; \
	    exit 1; \
	  fi; \
	fi

test:
	@echo "→ Tests BATS…"
	@if command -v bats >/dev/null 2>&1; then \
	  bats tests; \
	else \
	  echo "BATS n'est pas installé (commande 'bats' introuvable)"; \
	  exit 1; \
	fi

ci: lint test
	@echo "✅ CI locale terminée avec succès"
