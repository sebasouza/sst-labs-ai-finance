# Makefile for sst-labs-ai-finance backend

# List of backend microservices
SERVICES=$(shell find . -type d -mindepth 1 -maxdepth 1 -not -path './.*' -exec basename {} \;)

# Targets
.PHONY: all ensure-poetry poetry-install run pre-commit lint test clean help $(SERVICES)

# Commands
all: help

poetry-install: $(SERVICES)
run: $(SERVICES)
pre-commit: $(SERVICES)
lint: $(SERVICES)
test: $(SERVICES)
clean: $(SERVICES)

$(SERVICES):
	@echo "Processing service: $@"
	$(MAKE) -C $@ $(MAKECMDGOALS)

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  run                       - Run all services."
	@echo "  pre-commit                - Run pre-commit checks for all services."
	@echo "  lint                      - Lint all services."
	@echo "  test                      - Test all services."
	@echo "  clean                     - Clean all services."
	@echo "  <service>                 - Run the specified target for a specific service (e.g., make run-sst-health-service)."
