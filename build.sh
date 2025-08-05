#!/usr/bin/env bash

###############################################################################
# build.sh
#
# Installs Ruby, runs validation checks, and builds the Jekyll project.
###############################################################################

# Enable strict Bash options:
# - exit immediately if a command fails (errexit)
# - treat unset variables as an error (nounset)
# - ensure failures in any part of a pipeline cause the pipeline to fail (pipefail)
set -euo pipefail

# Safe fallback for CI environments without a terminal
if command -v tput >/dev/null && [ -n "${TERM-}" ] && tput colors >/dev/null 2>&1; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  CYAN="$(tput setaf 6)"
  RESET="$(tput sgr0)"
else
  RED=""; GREEN=""; YELLOW=""; CYAN=""; RESET=""
fi

# Logging functions
log_info()    { echo "${CYAN}[INFO]${RESET}    $*"; }
log_success() { echo "${GREEN}[SUCCESS]${RESET} $*"; }
log_warning() { echo "${YELLOW}[WARNING]${RESET} $*"; }
log_error()   { echo "${RED}[ERROR]${RESET}   $*" >&2; exit 1; }

# Function: Install Ruby if not present
install_ruby() {
  if command -v ruby >/dev/null 2>&1; then
    log_info "Ruby found: $(ruby --version)"
    return
  fi

  log_info "Ruby not found – installing via apt-get"
  sudo apt-get update -qq
  sudo apt-get install -y ruby-full build-essential zlib1g-dev

  log_success "Ruby installed: $(ruby --version)"
}

# Function: Install Bundler gem if not present
install_bundler() {
  if gem list bundler -i >/dev/null 2>&1; then
    log_info "Bundler found: $(bundle --version)"
    return
  fi

  log_info "Installing Bundler"
  gem install bundler --no-document

  log_success "Bundler installed: $(bundle --version)"
}

# Function: Install project dependencies via Bundler
install_dependencies() {
  if [ -f Gemfile ]; then
    log_info "Installing gems from Gemfile"
    bundle config set --local path 'vendor/bundle'
    bundle install --jobs=4 --retry=3
    log_success "Gems installed"
  else
    log_warning "No Gemfile found – skipping bundle install"
  fi
}

# Function: Run Jekyll validation checks
run_checks() {
  log_info "Running 'jekyll doctor' for validation"
  if bundle exec jekyll doctor; then
    log_success "'jekyll doctor' completed without errors"
  else
    log_warning "'jekyll doctor' reported issues – review output"
  fi
}

# Function: Fetch full Git history and build site
run_build() {
  log_info "Fetching full repository history"
  git fetch --unshallow || log_warning "Repository already has full history"

  log_info "Starting Jekyll build"
  bundle exec jekyll build --verbose
  cp ./assets/_headers ./_site/_headers
  rm -f _site/wrangler.toml
  log_success "Jekyll build completed – output in _site/"
}

# Main execution flow
main() {
  log_info "Starting build process"
  install_ruby
  install_bundler
  install_dependencies
  run_checks
  run_build
  log_success "build.sh executed successfully"
}

# Execute main with any provided arguments
main "$@"
