# Makefile for sst-labs-ai-finance backend

# Variables
YAMLLINT_CONFIG = ../.yamllint
FLAKE8_CONFIG = ../.flake8
ISORT_CONFIG = ../.isort.cfg
PYLINT_CONFIG = ../.pylintrc
MYPY_CONFIG = ../mypy.ini

# List of backend microservices
SERVICES=$(shell find . -type d -mindepth 1 -maxdepth 1 -not -path './.*' -exec basename {} \;)

# Targets
.PHONY: all ensure-poetry poetry-setup-backend backend-% lint test clean help

# Commands
all: help

# Check if Poetry is installed, and install it if necessary
ensure-poetry:
	@echo "Checking if Poetry is installed..."
	@if ! command -v poetry > /dev/null; then \
		echo "Poetry not found. Installing Poetry..."; \
		curl -sSL https://install.python-poetry.org | python3 -; \
		echo "Poetry installed successfully!"; \
	else \
		echo "Poetry is already installed."; \
	fi

# Set up Poetry for all backend services
poetry-setup-backend: ensure-poetry
	@echo "Setting up Poetry environment for all backend services..."
	@set -e; for service in $(SERVICES); do \
		echo "Processing backend service: $$service"; \
		cd $$service; \
		poetry update; \
		poetry check; \
		poetry lock; \
		poetry export -f requirements.txt --output requirements.txt; \
		poetry sync; \
		poetry install; \
		cd - > /dev/null; \
		echo "Completed setup for $$service."; \
	done
	@echo "Poetry setup completed for all services!"

# Run a specific backend service
backend-%: poetry-setup-backend
	@echo "Running backend microservice: $*..."
	@set -e; cd $(BACKEND_DIR)/$* && poetry run uvicorn main:app --reload
	@echo "Backend microservice $* started successfully."

pre-commit: poetry-setup-backend
	@echo "Running pre-commit checks for all backend microservices..."
	@set -e; for service in $(SERVICES); do \
  		echo "Processing backend service: $$service"; \
		cd $$service; \
		poetry run pre-commit clean; \
		poetry run pre-commit autoupdate; \
		poetry run pre-commit install; \
		poetry run pre-commit run --all-files --verbose; \
		cd - > /dev/null; \
		echo "Completed pre-commit checks for $$service."; \
	done
	@echo "Pre-commit linting completed for all backend microservices!"

lint: poetry-setup-backend
	@echo "Running linting for all backend microservices..."
	@set -e; for service in $(SERVICES); do \
		cd $$service; \
		poetry run black . --line-length=120; \
		poetry run flake8 . --config $(FLAKE8_CONFIG); \
		poetry run isort . --settings-path $(ISORT_CONFIG); \
		poetry run yamllint . --config-file=$(YAMLLINT_CONFIG); \
		poetry run pylint . --rcfile=$(PYLINT_CONFIG); \
		poetry run mypy . --config-file=$(MYPY_CONFIG); \
		cd - > /dev/null; \
	done
	@echo "Backend linting completed successfully."

# Test all backend services
test: poetry-setup-backend
	@echo "Running tests for all backend microservices..."
	@set -e; for service in $(SERVICES); do \
		cd $$service; \
		poetry run pytest; \
		cd - > /dev/null; \
	done
	@echo "Backend tests completed successfully."

# Clean all backend services
clean:
	@echo "Cleaning up backend services..."
	@set -e; for service in $(SERVICES); do \
		cd $$service; \
		rm -rf .venv; \
		rm -f requirements.txt; \
		rm -rf __pycache__; \
		rm -rf .pytest_cache;
		cd - > /dev/null; \
	done
	echo "Clean backend completed successfully."

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  ensure-poetry			   - Ensure Poetry is installed."
	@echo "  poetry-setup-backend      - Set up Poetry for all services."
	@echo "  backend-<service>         - Run a specific backend microservice (e.g., make backend_health)."
	@echo "  pre-commit                - Run pre-commit checks for all services."
	@echo "  lint                      - Run linting for all services."
	@echo "  test                      - Run tests for all services."
	@echo "  clean                     - Clean all services (backend, frontend, and mobile)."
	@echo "  help                      - Show this help message."
