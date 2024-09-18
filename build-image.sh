#!/bin/sh

set -xe

if [ -z "$PRJ" ]; then
    echo "PRJ variable is not set"
    echo "Execute: " 
    echo "  - PRJ=\$(sudo elbe control create_project)"
    echo "  - export PRJ"

    exit 1
fi

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

sudo elbe control set_xml $PRJ $1

sudo elbe control build $PRJ

sudo elbe control wait_busy $PRJ

output_folder="elbe-$(date +%Y%m%d-%H%M%S)"

sudo elbe control get_files --output="$output_folder" $PRJ

