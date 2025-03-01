# Makefile for managing Docker Compose environments

COMPOSE = docker compose -f docker-compose.dev.yml
COMPOSE_PROD = docker compose -f docker-compose.prod.yml

.PHONY: all help up down rebuild build logs prod-up prod-down build-prod logs-prod

## Default: Start the environment and display logs immediately
all: up-with-logs

help:
	@echo "Usage:"
	@echo "  make            - Start dev environment with logs"
	@echo "  make up         - Start environment (detached)"
	@echo "  make down       - Stop environment"
	@echo "  make rebuild    - Stop, rebuild, and restart with logs"
	@echo "  make purge      - Remove only this project's containers, volumes, and networks"
	@echo "  make build      - Build images"
	@echo "  make logs       - Follow logs for the environment"
	@echo ""
	@echo "  make prod-up    - Start production environment (detached)"
	@echo "  make prod-down  - Stop production environment"
	@echo "  make build-prod - Build production images"
	@echo "  make logs-prod  - Follow logs for production environment"
	@echo ""
	@echo "  make help       - Show this help"

### Development environment commands ###

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

rebuild:
	$(COMPOSE) down
	$(COMPOSE) build
	$(COMPOSE) up && $(COMPOSE) logs -f

build:
	$(COMPOSE) build

logs:
	$(COMPOSE) logs -f

up-with-logs:
	$(COMPOSE) up && $(COMPOSE) logs -f


### Production environment commands ###
prod-up:
	$(COMPOSE_PROD) up -d

prod-down:
	$(COMPOSE_PROD) down

build-prod:
	$(COMPOSE_PROD) build

logs-prod:
	$(COMPOSE_PROD) logs -f
