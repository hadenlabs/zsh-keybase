#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function keybase::gpg::install {
    if ! type -p brew > /dev/null; then
        message_warning "${KEYBASE_MESSAGE_BREW}"
        return
    fi
    message_info "Installing dependences for ${KEYBASE_PACKAGE_NAME}"
    brew install gpg
    message_success "Installed dependences for ${KEYBASE_PACKAGE_NAME}"
}

if ! type -p gpg > /dev/null; then keybase::gpg::install; fi