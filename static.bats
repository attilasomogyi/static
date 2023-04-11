load test_helper/static.bash

@test "jsonlint" {
  run yarn jsonlint
  print_errors
  [ "$status" -eq 0 ]
}

@test "actionlint" {
  run actionlint
  print_errors
  [ "$status" -eq 0 ]
}

@test "cspell" {
  run yarn cspell lint --fail-fast .
  print_errors
  [ "$status" -eq 0 ]
}

@test "shellcheck" {
  run bash -e scripts/shellcheck.sh
  print_errors
  [ "$status" -eq 0 ]
}

@test "shfmt" {
  run bash -e scripts/shfmt.sh
  print_errors
  [ "$status" -eq 0 ]
}

@test "editorconfig-checker" {
  run editorconfig-checker
  print_errors
  [ "$status" -eq 0 ]
}

@test "markdownlint-cli" {
  run yarn markdownlint '**/*.md'
  print_errors
  [ "$status" -eq 0 ]
}

@test "rstcheck" {
  run rstcheck --recursive .
  print_errors
  [ "$status" -eq 0 ]
}

@test "yamllint" {
  run yamllint .
  print_errors
  [ "$status" -eq 0 ]
}

@test "stylelint" {
  run bash -e scripts/stylelint.sh
  print_errors
  [ "$status" -eq 0 ]
}

@test "v8r" {
  run bash -e scripts/v8r.sh
  print_errors
  [ "$status" -eq 0 ]
}

@test "jscpd" {
  run yarn jscpd
  print_errors
  [ "$status" -eq 0 ]
}

@test "gitleaks" {
  run gitleaks detect .
  print_errors
  [ "$status" -eq 0 ]
}

@test "secretlint" {
  run yarn secretlint "**/*"
  print_errors
  [ "$status" -eq 0 ]
}

@test "trivy" {
  run trivy fs .
  print_errors
  [ "$status" -eq 0 ]
}

@test "sphinx doctest and linkcheck" {
  run bash -e scripts/sphinx_test.sh
  print_errors
  [ "$status" -eq 0 ]
}

teardown() {
  make -C docs -b clean
}
