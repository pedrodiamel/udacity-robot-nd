SHELL := /bin/bash

COMPOSE ?= docker compose
SERVICE ?= ndros

.PHONY: help build up down shell logs ps restart xhost-allow docker-build docker-down docker-start

help:
	@echo "Available targets:"
	@echo "  make build         Build image for $(SERVICE)"
	@echo "  make up            Build and start $(SERVICE) in background"
	@echo "  make shell         Open bash shell in $(SERVICE)"
	@echo "  make logs          Follow service logs"
	@echo "  make ps            Show compose services status"
	@echo "  make restart       Restart $(SERVICE)"
	@echo "  make down          Stop and remove compose resources"
	@echo ""
	@echo "Backward-compatible aliases:"
	@echo "  make docker-build  -> make up"
	@echo "  make docker-down   -> make down"
	@echo "  make docker-start  -> make shell"

build:
	$(COMPOSE) build $(SERVICE)

up:
	$(COMPOSE) up -d --build $(SERVICE)

down:
	$(COMPOSE) down --remove-orphans

shell: xhost-allow up
	$(COMPOSE) exec $(SERVICE) /bin/bash

logs:
	$(COMPOSE) logs -f --tail=200 $(SERVICE)

ps:
	$(COMPOSE) ps

restart:
	$(COMPOSE) restart $(SERVICE)

xhost-allow:
	@if [[ -n "$$DISPLAY" ]] && command -v xhost >/dev/null 2>&1; then \
		xhost +local:root >/dev/null; \
	else \
		echo "Skipping xhost authorization (DISPLAY or xhost unavailable)."; \
	fi

docker-build: up

docker-down: down

docker-start: shell