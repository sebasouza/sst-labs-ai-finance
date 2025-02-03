# sst-health-service: Health Service

**sst-health-service** is the foundational FastAPI microservice for the sst-labs-ai-finance solution. Initially, this service provides a basic health-check endpoint to ensure that the system is up and running. It serves as the walking skeleton for the backend, which will later be expanded with additional functionality for financial data processing and AI-driven insights.

## Overview

The **sst-health-service** is a lightweight FastAPI service that:
- Exposes a `/health` endpoint to confirm the service is operational.
- Serves as the entry point for future financial microservices.
- Uses modern Python practices and dependency management via Poetry.
- Is containerized for consistent deployments.

## Features

- **Health Check Endpoint:**
  A simple GET endpoint at `/health` that returns the current status of the service.

- **Modular and Extendable:**
  Designed to be the foundation for additional endpoints and services as part of the sst-labs-ai-finance ecosystem.

- **Container Ready:**
  Includes a Dockerfile for containerizing the service, ensuring consistency across environments.

## Getting Started

### Prerequisites

- Python 3.13 or higher
- [Poetry](https://python-poetry.org/) for dependency management
- [Docker](https://www.docker.com/) (optional, for containerized deployment)
- [Git](https://git-scm.com/)

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/sebasouza/sst-labs-ai-finance.git
   cd sst-labs-ai-finance/backend/sst_health_service
   ```
