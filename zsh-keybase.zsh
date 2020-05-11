#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install keybase for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
export KEYBASE_PACKAGE_NAME="keybase"

KEYBASE_PLUGIN_DIR="$(dirname "${0}")"
KEYBASE_SOURCE_PATH="${KEYBASE_PLUGIN_DIR}"/src

export KEYBASE_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export KEYBASE_MESSAGE_YAY="Please install Go or use antibody bundle luismayta/zsh-goenv branch:develop"
export KEYBASE_MESSAGE_NOT_FOUND="this not found installed"

# shellcheck source=/dev/null
source "${KEYBASE_SOURCE_PATH}"/base.zsh

# keybase::cross::os functions for osx and linux
function keybase::cross::os {

    case "${OSTYPE}" in
        linux*)
            # shellcheck source=/dev/null
            source "${KEYBASE_SOURCE_PATH}"/linux.zsh
            ;;
        darwin*)
            # shellcheck source=/dev/null
            source "${KEYBASE_SOURCE_PATH}"/osx.zsh
            ;;
    esac

}

keybase::cross::os

# shellcheck source=/dev/null
source "${KEYBASE_SOURCE_PATH}"/pgp.zsh
