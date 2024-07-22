#!/bin/bash

# Run binary and restrict internet access

# Create no-internet group
iptables -I OUTPUT 1 -m owner --gid-owner no-internet -j DROP

# Run args with group no-internet
sg no-internet "$@"
