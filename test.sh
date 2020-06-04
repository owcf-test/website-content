#!/bin/sh

# If a command fails then the deploy stops
set -e

hugo server
