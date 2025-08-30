# Makefile for managing Docker Compose environments

# Detect compose command: prefer 'docker compose', fallback to 'docker-compose'
DOCKER_COMPOSE := $(shell docker compose version >/dev/null 2>&1 && echo "docker compose" || (docker-compose version >/dev/null 2>&1 && echo "docker-compose" || echo ""))

ifeq ($(DOCKER_COMPOSE),)
$(error Neither 'docker compose' nor 'docker-compose' found. Install the Compose plugin or docker-compose.)
endif

# ---- Settings ----
COMPOSE_PROJECT_NAME ?= portfolio
export COMPOSE_PROJECT_NAME

DEV_FILE  := docker-compose.dev.yml
PROD_FILE := docker-compose.prod.yml

COMPOSE      := $(DOCKER_COMPOSE) -f $(DEV_FILE)
COMPOSE_PROD := $(DOCKER_COMPOSE) -f $(PROD_FILE)

# Uncomment if you need cross-arch builds from Apple Silicon → x86
# export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Default target
.DEFAULT_GOAL := help

.PHONY: help up down rebuild-soft rebuild-hard build logs follow purge \
        test test-watch test-file test-coverage \
        prod-up prod-down prod-build prod-rebuild prod-logs prod-pull prod-deploy \
        caddy-reload

help:
	@echo "Usage:"
	@echo "  make up              - Start dev env (detached)"
	@echo "  make follow          - Follow dev logs"
	@echo "  make down            - Stop dev env"
	@echo "  make build           - Build dev images"
	@echo "  make rebuild-soft    - Rebuild dev (no volume wipe)"
	@echo "  make rebuild-hard    - Rebuild dev (DOWN -v; destructive)"
	@echo "  make purge           - Remove dev containers, networks, volumes (destructive)"
	@echo "  make test            - Run all tests"
	@echo "  make test-watch      - Run tests in watch mode"
	@echo "  make test-file TEST=path/to/spec.ts - Run a specific test"
	@echo "  make test-coverage   - Run tests with coverage"
	@echo ""
	@echo "  make prod-up         - Start production (detached)"
	@echo "  make prod-down       - Stop production"
	@echo "  make prod-build      - Build production images"
	@echo "  make prod-rebuild    - Rebuild prod (down + build + up)"
	@echo "  make prod-logs       - Follow production logs"
	@echo "  make prod-pull       - Pull latest images"
	@echo "  make prod-deploy     - Pull + up -d --remove-orphans"
	@echo "  make caddy-reload    - Hot-reload Caddy (if present)"

# ---- Dev ----
up:
	$(COMPOSE) up -d

follow logs:
	$(COMPOSE) logs -f

down:
	$(COMPOSE) down

build:
	$(COMPOSE) build

rebuild-soft:
	$(COMPOSE) build --no-cache
	$(COMPOSE) up -d

rebuild-hard:
	$(COMPOSE) down -v --remove-orphans
	$(COMPOSE) build --no-cache
	$(COMPOSE) up -d

purge:
	$(COMPOSE) down -v --remove-orphans

# ---- Tests (run inside frontend/) ----
FRONTEND_DIR = frontend
VITEST = npx vitest

test:
	@cd $(FRONTEND_DIR) && $(VITEST) --run

test-watch:
	@cd $(FRONTEND_DIR) && $(VITEST)

test-file:
	@if [ -z "$(TEST)" ]; then echo "ERROR: provide TEST=path/to/spec.ts"; exit 1; fi
	@cd $(FRONTEND_DIR) && $(VITEST) --run --include $(TEST)

test-coverage:
	@cd $(FRONTEND_DIR) && $(VITEST) --coverage

# ---- Prod ----
prod-up:
	$(COMPOSE_PROD) up -d

prod-logs:
	$(COMPOSE_PROD) logs -f

prod-down:
	$(COMPOSE_PROD) down

prod-build:
	$(COMPOSE_PROD) build

prod-rebuild:
	$(COMPOSE_PROD) down --remove-orphans
	$(COMPOSE_PROD) build --no-cache
	$(COMPOSE_PROD) up -d

prod-pull:
	$(COMPOSE_PROD) pull

prod-deploy:
	$(COMPOSE_PROD) pull
	$(COMPOSE_PROD) up -d --remove-orphans

# ---- Utilities ----
caddy-reload:
	-$(COMPOSE_PROD) exec caddy caddy reload --config /etc/caddy/Caddyfile || true
