#!/bin/bash

# Check if docker is installed
if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed. Please install docker first!' >&2
    exit 1
fi

# Check Docker version
DOCKER_SERVER_VERSION=$(docker version -f "{{.Server.Version}}")
DOCKER_SERVER_VERSION_MAJOR=$(echo "$DOCKER_SERVER_VERSION"| cut -d'.' -f 1)

if [ "${DOCKER_SERVER_VERSION_MAJOR}" -ge 20 ]; then
    echo 'Docker version >= 20.10.13, using Docker Compose V2'
else
    echo 'Docker versions < 20.x are not supported' >&2 
    exit 1
fi

# Check Docker Compose
if ! [ -x "$(command -v docker compose version)" ]; then
    echo 'Error: docker compose is not installed. Please install docker compose.' >&2
    exit 1
fi

# Default environment file
ENV_FILE=".env"

# Function to start services
start_services() {
    echo "Starting DrVital services..."
    docker compose --env-file "$ENV_FILE" up -d
}

# Function to stop services
stop_services() {
    echo "Stopping DrVital services..."
    docker compose --env-file "$ENV_FILE" down
}

# Function to show logs
show_logs() {
    echo "Showing logs for all services..."
    docker compose --env-file "$ENV_FILE" logs -f
}

# Function to show status
show_status() {
    echo "Showing status of all services..."
    docker compose --env-file "$ENV_FILE" ps
}

# Main menu
echo "DrVital Docker Management"
echo "------------------------"
echo "1) Start services"
echo "2) Stop services"
echo "3) Show logs"
echo "4) Show status"
echo "5) Exit"
echo "------------------------"

read -p "Select an option: " option

case $option in
    1)
        start_services
        ;;
    2)
        stop_services
        ;;
    3)
        show_logs
        ;;
    4)
        show_status
        ;;
    5)
        exit 0
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac 