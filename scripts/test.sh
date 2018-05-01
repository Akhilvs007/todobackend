#!/bin/bash
# Activate virtual environment
. /appenv/bin/activate


#download req to build cache
pip download -d /build -r requirements_test.txt --no-input


# Install application test requirement
pip install --no-index -f /build -r requirements_test.txt

# Run test.sh arguments
exec $@
