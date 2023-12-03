#!/bin/bash
set -euo pipefail

# must be a float within 0.0 - 1.0 range
BRIGHTNESS_LEVEL="${1:-1.0}"

function main {
    echo "Using BRIGHTNESS_LEVEL: ${BRIGHTNESS_LEVEL}..."

    xrandr --listmonitors |\
        grep -E -o '\s\w+(-1)' |\
        xargs -I '{}' xrandr --output '{}' --brightness "${BRIGHTNESS_LEVEL}"
}

main
