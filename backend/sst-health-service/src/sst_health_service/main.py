"""
This module contains the main entry point for the SST Health Service API.
"""

import os

import uvicorn
from dotenv import load_dotenv
from fastapi import FastAPI

load_dotenv()
app = FastAPI()


@app.get("/health")
async def health_check() -> dict[str, str]:
    """
    Handles the health check endpoint for the application.

    This asynchronous function is invoked when the health check endpoint of
    the API is called. It verifies that the application is up and running and
    returns a standard response with status and a descriptive message.

    :return: A JSON object containing the status and health message of the
             application.
    :rtype: dict
    """
    return {"status": "OK", "message": "SST Health Service is running!"}


if __name__ == "__main__":
    host = os.getenv("HOST", "localhost")
    port = int(os.getenv("PORT", "8000"))
    uvicorn.run(app, host=host, port=port)
