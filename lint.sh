#!/usr/bin/env bash

set -e

function QUOTED() {
  echo "$(printf "%q " "$@")"
}

function GREP() {
  if ! grep "$@" ; then
    echo FAILED: grep "$(QUOTED "$@")" >&2
    exit 1
  fi
}

GREP -q '^\* Lines must match `/.\+/` and be less than .. chars wide$' readme.md

# TODO: Extract the regex and line length, then check all *.md files

echo OK
