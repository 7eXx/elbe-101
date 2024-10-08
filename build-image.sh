#!/bin/sh

set -o allexport
[ -f .env ] && . ./.env
[ -f .env.local ] && . ./.env.local
set +o allexport

set -e

if [ -z "$PRJ" ]; then
    PRJ=$(elbe control create_project)
    echo "Creating a new project - $PRJ"
    echo "PRJ=$PRJ" > .env.local
fi

echo "Using project - $PRJ"

if [ -z "$1" ]; then
    echo "Missing project xml file"
    echo "Use: "
    echo "  - ./elbe-control-build.sh <project xml file>"

    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File not found: $1"

    exit 1
fi

elbe control set_xml $PRJ $1

elbe control build $PRJ

elbe control wait_busy $PRJ

output_folder="elbe-$(date +%Y%m%d-%H%M%S)"

elbe control get_files --output="$output_folder" $PRJ

