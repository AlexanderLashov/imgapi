#!/bin/bash

PROJECT_DIR=$(pwd)

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to handle errors
handle_error() {
  echo "Error: $1"
  exit 1
}

# Check if Node.js is installed
if ! command_exists node; then
  echo "Node.js is not installed. Installing Node.js..."
  # Install Node.js
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - || handle_error "Failed to setup Node.js"
  sudo apt-get install -y nodejs || handle_error "Failed to install Node.js"
fi

# Check if npm is installed
if ! command_exists npm; then
  echo "npm is not installed. Installing npm..."
  sudo apt-get install -y npm || handle_error "Failed to install npm"
fi

# Check if app.js and package.json exist
if [ ! -f "$PROJECT_DIR/app.js" ] || [ ! -f "$PROJECT_DIR/package.json" ]; then
  handle_error "app.js or package.json not found in the project directory"
fi

# Install project dependencies
echo "Installing project dependencies..."
npm install || handle_error "Failed to install project dependencies"

# Run the Node.js application
echo "Starting the Node.js application..."
nohup node app.js > app.log 2>&1 &

sleep 5

HTML_FILE_PATH="$PROJECT_DIR/frontend/index.html"
if [ ! -f "$HTML_FILE_PATH" ]; then
  handle_error "HTML file not found at $HTML_FILE_PATH"
fi

# Only try to open the web browser if not in a CI environment
if [ -z "$CI" ]; then
  echo "Opening the HTML file at $HTML_FILE_PATH..."
  xdg-open "$HTML_FILE_PATH" || handle_error "Failed to open HTML file"
fi
echo "Setup complete. Your app is running and the HTML page should be open in your browser."

tail -f app.log