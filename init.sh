#!/bin/sh

echo "Dropping database (if it exists)..."
dropdb codeclan_cinema

echo "Creating database..."
createdb codeclan_cinema

echo "Creating tables..."
psql -d codeclan_cinema -f ./db/codeclan_cinema.sql

echo "Done!"