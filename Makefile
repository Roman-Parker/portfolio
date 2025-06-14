# Makefile for managing Docker Compose environments

COMPOSE = docker compose -f docker-compose.dev.yml
COMPOSE_PROD = docker compose -f docker-compose.prod.yml

.PHONY: all help up down rebuild build logs prod-up prod-down build-prod logs-prod

## Default: Start the environment and display logs immediately
all: up

help:
	@echo "Usage:"
	@echo "  make            - Start dev environment with logs"
	@echo "  make up         - Start environment (detached)"
	@echo "  make down       - Stop environment"
	@echo "  make rebuild    - Stop, rebuild, and restart with logs"
	@echo "  make purge      - Remove only this project's containers, volumes, and networks"
	@echo "  make build      - Build images"
	@echo "  make logs       - Follow logs for the environment"
	@echo "  make test       - Run all tests"
	@echo "  make test-watch - Run tests in watch mode"
	@echo "  make test-file  - Run a specific test file (pass as TEST=<filename>)"
	@echo "  make test-coverage - Run tests with coverage"
	@echo ""
	@echo "  make prod-up    - Start production environment (detached)"
	@echo "  make prod-down  - Stop production environment"
	@echo "  make prod-build - Build production images"
	@echo "  make prod-logs  - Follow logs for production environment"
	@echo ""
	@echo "  make help       - Show this help"

### Development environment commands ###

up:
	$(COMPOSE) up -d && $(COMPOSE) logs -f

down:
	$(COMPOSE) down

rebuild:
	$(COMPOSE) down -v
	$(COMPOSE) build --no-cache
	$(COMPOSE) up && $(COMPOSE) logs -f

build:
	$(COMPOSE) build

logs:
	$(COMPOSE) logs -f

FRONTEND_DIR = frontend
VITEST = npx vitest

# Run all tests inside frontend/
test:
	@cd $(FRONTEND_DIR) && $(VITEST) --run

# Run tests in watch mode
test-watch:
	@cd $(FRONTEND_DIR) && $(VITEST)

# Run a specific test file (pass as TEST=<filename>)
test-file:
	@cd $(FRONTEND_DIR) && $(VITEST) --run --include $(TEST)

# Run tests with coverage
test-coverage:
	@cd $(FRONTEND_DIR) && $(VITEST) --coverage


### Production environment commands ###
prod-up:
	$(COMPOSE_PROD) up -d
	$(COMPOSE_PROD) logs -f

prod-down:
	$(COMPOSE_PROD) down

prod-build:
	$(COMPOSE_PROD) build

prod-rebuild:
	$(COMPOSE_PROD) down
	$(COMPOSE_PROD) build
	$(COMPOSE_PROD) up -d && $(COMPOSE_PROD) logs -f

prod-logs:
	$(COMPOSE_PROD) logs -f
