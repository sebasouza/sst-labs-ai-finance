# Makefile for sst-labs-ai-finance

# Aliases for all Makefiles
BACKEND_MAKEFILE = backend/Makefile
FRONTEND_MAKEFILE = frontend/Makefile
MOBILE_MAKEFILE = mobile/Makefile

# Run backend-specific targets (e.g., pre-commit, test) by delegating to backend Makefile
backend-%:
	$(MAKE) -f $(BACKEND_MAKEFILE) $(@:backend-%=%)

# Run frontend-specific targets (e.g., install, lint) by delegating to frontend Makefile
frontend-%:
	$(MAKE) -f $(FRONTEND_MAKEFILE) $(@:frontend-%=%)

# Run mobile-specific targets (e.g., install, lint) by delegating to mobile Makefile
mobile-%:
	$(MAKE) -f $(MOBILE_MAKEFILE) $(@:mobile-%=%)

# Help
help:
	@echo "Available targets:"
	@echo "  all                       - Show this help message."
	@echo "  backend-pre-commit        - Run pre-commit checks for all backend microservices."
	@echo "  backend-test              - Run tests for all backend microservices."
	@echo "  backend-clean             - Clean all backend microservices."
	@echo "  frontend-build            - Build all frontend micro-frontends."
	@echo "  frontend-test             - Run tests for all frontend micro-frontends."
	@echo "  frontend-clean            - Clean all frontend micro-frontends."
	@echo "  mobile                    - Start the mobile app."
	@echo "  help                      - Show this help message."
