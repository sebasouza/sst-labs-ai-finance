# Makefile for sst-labs-ai-finance frontend

# Variables
# Dynamically find all micro-frontends
MICROFRONTENDS = $(shell find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)

# Common commands
NPM = npm

# Targets
.PHONY: all frontend-% build clean test help

# Commands
all: help

# Install dependencies for all micro-frontends
install:
	@echo "Installing dependencies for all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Installing dependencies for $$mfe..."; \
		cd $$mfe && $(NPM) install && cd - > /dev/null; \
	done
	@echo "All dependencies installed!"

# Start development servers for all micro-frontends
start: install
	@echo "Starting development servers for all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Starting $$mfe..."; \
		cd $$mfe && $(NPM) start & \
		cd - > /dev/null; \
	done
	@echo "All development servers started!"


# Start a specific frontend micro-frontend
frontend-%:
	@echo "Starting frontend micro-frontend: $*..."
	@set -e; cd $* && npm run dev
	@echo "Frontend micro-frontend $* started successfully."

# Build all micro-frontends for production
build:
	@echo "Building all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Building $$mfe..."; \
		cd $$mfe && $(NPM) run build && cd - > /dev/null; \
	done
	@echo "All micro-frontends built successfully!"

# Run linting for all micro-frontends
lint:
	@echo "Linting all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Linting $$mfe..."; \
		cd $$mfe && $(NPM) run lint && cd - > /dev/null; \
	done
	@echo "All micro-frontends linted successfully!"

# Run tests for all micro-frontends
test:
	@echo "Running tests for all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Testing $$mfe..."; \
		cd $$mfe && $(NPM) test && cd - > /dev/null; \
	done
	@echo "All tests completed successfully!"


# Clean up all micro-frontends (e.g., remove build artifacts, node_modules)
clean:
	@echo "Cleaning all micro-frontends..."
	@set -e; \
	for mfe in $(MICROFRONTENDS); do \
		echo "Cleaning $$mfe..."; \
		cd $$mfe && $(NPM) run clean && cd - > /dev/null; \
	done
	@echo "All micro-frontends cleaned successfully!"

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  frontend_<service>        - Run a specific frontend micro-frontend (e.g., make frontend_landing)."
	@echo "  build		               - Build all frontend micro-frontends."
	@echo "  test                      - Run tests for all frontend micro-frontends."
	@echo "  clean                     - Clean all frontend micro-frontends."
	@echo "  help                      - Show this help message."
