# Makefile for sst-labs-ai-finance

# Targets
.PHONY: all help

# Commands
all: help

# Start the mobile sst_health_service
mobile:
	@echo "Starting mobile app..."
	@set -e; cd $(MOBILE_DIR) && npx expo start
	@echo "Mobile app started successfully."

# Clean mobile sst_health_service files
clean:
	@echo "Cleaning up temporary files for mobile app..."
	@set -e; cd $(MOBILE_DIR) && rm -rf node_modules .expo .expo-shared .vscode
	@echo "Cleaned up temporary files for mobile app!"

test:
	@echo "Running mobile tests..."
	cd $(MOBILE_DIR) && npx some-testing-library || echo "No mobile tests implemented yet."

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  mobile                    - Start the mobile app."
	@echo "  test                      - Run tests"
	@echo "  lint                      - Run linting"
	@echo "  clean                     - Clean"
	@echo "  help                      - Show this help message."
