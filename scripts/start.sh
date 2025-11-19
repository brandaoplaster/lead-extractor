#!/usr/bin/env bash

set -e  # Exit on error

echo "Checking dependencies..."
bundle check || bundle install

# Look for running Rails processes
rails_pid=$(pgrep -f "bin/rails server|puma" || true)

if [ -n "$rails_pid" ]; then
  echo "Rails/Puma server process found (PID: $rails_pid)"
  echo "Shutting down process..."

  kill -TERM $rails_pid

  # Wait for graceful shutdown
  for i in {1..10}; do
    if ! kill -0 $rails_pid 2>/dev/null; then
      echo "Process terminated successfully"
      break
    fi
    sleep 1
  done

  # Force kill if still running
  if kill -0 $rails_pid 2>/dev/null; then
    echo "Forcing shutdown..."
    kill -9 $rails_pid
  fi
else
  echo "No Rails/Puma process running"
fi

echo "Starting Puma server..."
bundle exec puma -C config/puma.rb
