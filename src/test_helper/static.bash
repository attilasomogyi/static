#!/usr/bin/env bash

set -e

# shellcheck disable=SC2154
function print_errors() {
  for line in "${lines[@]}"; do
    echo "$line"
  done
}
