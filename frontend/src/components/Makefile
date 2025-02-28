# This Makefile provides shortcuts for building, running, and stopping
# Docker Compose setups in both dev and prod modes.

COMPOSE_DEV = docker-compose -f docker-compose.dev.yml
COMPOSE_PROD = docker-compose -f docker-compose.prod.yml

.PHONY: help dev dev-down build-dev logs-dev prod prod-down build-prod logs-prod

help:
	@echo "Usage:"
	@echo "  make dev        - Start development environment (detached)"
	@echo "  make dev-down   - Stop development environment"
	@echo "  make build-dev  - Build dev images"
	@echo "  make logs-dev   - Follow logs for dev environment"
	@echo ""
	@echo "  make prod       - Start production environment (detached)"
	@echo "  make prod-down  - Stop production environment"
	@echo "  make build-prod - Build production images"
	@echo "  make logs-prod  - Follow logs for production environment"
	@echo ""
	@echo "  make help       - Show this help"

# Development environment
dev:
	$(COMPOSE_DEV) up -d

dev-down:
	$(COMPOSE_DEV) down

build-dev:
	$(COMPOSE_DEV) build

logs-dev:
	$(COMPOSE_DEV) logs -f

# Production environment
prod:
	$(COMPOSE_PROD) up -d

prod-down:
	$(COMPOSE_PROD) down

build-prod:
	$(COMPOSE_PROD) build

logs-prod:
	$(COMPOSE_PROD) logs -f
