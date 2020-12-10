#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function keybase::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_KEYBASE_PATH}"/internal/base.zsh
    # shellcheck source=/dev/null
    source "${ZSH_KEYBASE_PATH}"/internal/helper.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_KEYBASE_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_KEYBASE_PATH}"/internal/linux.zsh
      ;;
    esac
}

keybase::internal::main::factory

if ! type -p rsync > /dev/null; then keybase::internal::rync::install; fi
if ! type -p keybase > /dev/null; then keybase::internal::keybase::install; fi
if ! type -p gpg > /dev/null; then keybase::internal::gpg::install; fi
