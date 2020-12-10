#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function keybase::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_KEYBASE_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_KEYBASE_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_KEYBASE_PATH}"/config/linux.zsh
      ;;
    esac
}

keybase::config::main::factory
