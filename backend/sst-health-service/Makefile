# Makefile for sst-labs-ai-finance backend

# Variables
YAMLLINT_CONFIG = ../.yamllint
FLAKE8_CONFIG = ../.flake8
ISORT_CONFIG = ../.isort.cfg
PYLINT_CONFIG = ../.pylintrc
MYPY_CONFIG = ../mypy.ini

SERVICE_NAME=sst-health-service

# Targets
.PHONY: all ensure-poetry poetry-install run pre-commit lint test clean help

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
poetry-install: ensure-poetry
	@echo "Setting up Poetry environment for $(SERVICE_NAME)..."
	@set -e; \
	poetry update; \
	poetry check; \
	poetry lock; \
	poetry export -f requirements.txt --output requirements.txt; \
	poetry sync; \
	poetry install; \
	echo "Poetry setup completed for $(SERVICE_NAME)!"

# Run
run:
	@echo "Running backend microservice: $(SERVICE_NAME)..."
	@set -e; \
	poetry install; \
	poetry run uvicorn src.$(subst -,_,$(SERVICE_NAME)).main:app --reload; \
	echo "Backend microservice $(SERVICE_NAME) started successfully."

pre-commit: poetry-install
	@echo "Running pre-commit checks for $(SERVICE_NAME)..."
	@set -e; \
	poetry run pre-commit clean; \
	poetry run pre-commit autoupdate; \
	poetry run pre-commit install; \
	poetry run pre-commit run --all-files --verbose; \
	echo "Pre-commit linting completed for $(SERVICE_NAME)."

lint: poetry-install
	@echo "Running linting for $(SERVICE_NAME)..."
	@set -e; \
	poetry run black . --line-length=120; \
	echo "Black completed successfully for $(SERVICE_NAME)."; \
	poetry run flake8 . --config $(FLAKE8_CONFIG); \
	echo "Flake8 completed successfully for $(SERVICE_NAME)."; \
	poetry run isort . --settings-path $(ISORT_CONFIG); \
	echo "Isort completed successfully for $(SERVICE_NAME)."; \
	poetry run yamllint . --config-file=$(YAMLLINT_CONFIG); \
	echo "Yamllint completed successfully for $(SERVICE_NAME)."; \
	poetry run pylint . --rcfile=$(PYLINT_CONFIG); \
	echo "Pylint completed successfully for $(SERVICE_NAME)."; \
	poetry run mypy . --config-file=$(MYPY_CONFIG); \
	echo "Mypy completed successfully for $(SERVICE_NAME)."; \
	poetry run bandit -r .; \
	echo "Bandit completed successfully for $(SERVICE_NAME)."; \
	echo "Backend linting completed successfully for $(SERVICE_NAME)."

# Test all backend services
test: poetry-install
	@echo "Running tests for $(SERVICE_NAME)..."
	@set -e; \
	poetry run pytest; \
	echo "Backend tests completed successfully for $(SERVICE_NAME)."

docker-build:
	@echo "Building Docker image for $(SERVICE_NAME)..."
	@set -e; \
	docker build -t $(SERVICE_NAME) .; \
	echo "Docker image for $(SERVICE_NAME) built successfully."

docker-run:
	@echo "Running Docker container for $(SERVICE_NAME)..."
	@set -e; \
	docker run -d -p 8000:8000 --name $(SERVICE_NAME) $(SERVICE_NAME); \
	echo "Docker container for $(SERVICE_NAME) started successfully."

docker-ps:
	@echo "Showing Docker processes..."
	@set -e; \
	docker ps; \
	echo "Docker processes shown successfully."

docker-logs:
	@echo "Showing Docker logs for $(SERVICE_NAME)..."
	@set -e; \
	docker logs $(SERVICE_NAME); \
	echo "Docker logs for $(SERVICE_NAME) shown successfully."

docker-stop:
	@echo "Stopping Docker container for $(SERVICE_NAME)..."
	@set -e; \
	if docker ps -q -f name=$(SERVICE_NAME); then \
		docker stop $(SERVICE_NAME); \
		echo "Docker container for $(SERVICE_NAME) stopped successfully."; \
	else \
		echo "No running container found for $(SERVICE_NAME)."; \
	fi

# Clean all backend services
clean:
	@echo "Cleaning up $(SERVICE_NAME)..."
	@set -e; \
	rm -rf .venv; \
#	rm -f requirements.txt; \
	rm -rf __pycache__; \
	rm -rf .pytest_cache;
	echo "Clean $(SERVICE_NAME) completed successfully."

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  ensure-poetry			   - Ensure Poetry is installed."
	@echo "  poetry-install            - Set up Poetry for backend service."
	@echo "  run		               - Run backend service."
	@echo "  pre-commit                - Run pre-commit checks for backend service."
	@echo "  lint                      - Run linting for backend service."
	@echo "  test                      - Run tests for backend service."
	@echo "  clean                     - Clean backend service."
	@echo "  help                      - Show this help message."
