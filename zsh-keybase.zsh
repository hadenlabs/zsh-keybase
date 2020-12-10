#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install keybase for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

ZSH_KEYBASE_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_KEYBASE_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_KEYBASE_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_KEYBASE_PATH}"/pkg/main.zsh
