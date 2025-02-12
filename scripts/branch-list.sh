#!/bin/bash

if [ "$(basename "$PWD")" != "jenkins" ]; then
    cd jenkins || { echo "Failed to change directory"; exit 1; }

fi
pwd
git branch -a
