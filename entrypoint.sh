#!/bin/bash

set -e

# Wait for PostgreSQL to be ready
/wait-for-it.sh db 5432 -- echo "PostgreSQL is up"

# Wait for MongoDB to be ready
/wait-for-it.sh mongo 27017 -- echo "MongoDB is up"

# Apply database migrations
python manage.py migrate

# Collect static files (optional, for production)
# python manage.py collectstatic --noinput

