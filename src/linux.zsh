#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# shellcheck disable=SC2154
function keybase::install {
    message_warning "Function not implemented"
    return
}

if ! type -p keybase > /dev/null; then keybase::install; fi
