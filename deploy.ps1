# Blood Management System Container Deployment Script

# Build the container image
Write-Host "🏗️ Building container image..." -ForegroundColor Green
podman build -t blood-management-system:latest .

# Run the container
Write-Host "🚀 Running container..." -ForegroundColor Green
podman run -d --name bms `
    -p 5000:5000 `
    -e MYSQL_HOST=host.containers.internal `
    blood-management-system:latest

# Test the container is running
Write-Host "🔍 Checking container status..." -ForegroundColor Green
podman ps

# Inspect the container
Write-Host "📋 Inspecting container details..." -ForegroundColor Green
podman inspect bms

# View container logs
Write-Host "📝 Viewing container logs..." -ForegroundColor Green
podman logs bms

# Stop the container
Write-Host "🛑 Stopping container..." -ForegroundColor Green
podman stop bms

# Remove the container
Write-Host "🗑️ Removing container..." -ForegroundColor Green
podman rm bms

# Tag the image for registry
Write-Host "🏷️ Tagging image..." -ForegroundColor Green
podman tag blood-management-system:latest quay.io/yourusername/blood-management-system:latest

# Login to registry
Write-Host "🔐 Logging into registry..." -ForegroundColor Green
podman login quay.io

# Push to registry
Write-Host "⬆️ Pushing image to registry..." -ForegroundColor Green
podman push quay.io/yourusername/blood-management-system:latest
