FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy all files from repo root
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir fastapi uvicorn[standard] supabase pydantic pydantic-settings structlog python-jose[cryptography] passlib[bcrypt] python-multipart httpx sqlalchemy asyncpg fhir.resources

# Expose port
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Create a parent directory structure and symlink to satisfy 'careplus' imports
RUN mkdir -p /app-parent && ln -s /app /app-parent/careplus
ENV PYTHONPATH=/app-parent

# Run the application
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
