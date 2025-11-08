#!/bin/bash

pandoc ./Report/project_proposal.md \
--lua-filter=./Report/scholarly-metadata.lua \
--lua-filter=./Report/format-authors.lua -s -o ./Report/initial_proposal.pdf