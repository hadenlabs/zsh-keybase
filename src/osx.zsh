#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# keybase::install - install keybase
function keybase::install {
    if ! type -p brew > /dev/null; then
        message_warning "${KEYBASE_MESSAGE_BREW}"
        return
    fi
    message_info "Installing ${KEYBASE_PACKAGE_NAME}"
    brew cask install "${KEYBASE_PACKAGE_NAME}"
    message_success "Installed ${KEYBASE_PACKAGE_NAME}"
}

if ! type -p keybase > /dev/null; then keybase::install; fi
