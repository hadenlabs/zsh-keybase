#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function keybase::internal::keybase::install {
    message_info "Installing ${KEYBASE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${KEYBASE_MESSAGE_BREW}"
        return
    fi
    brew install keybase
    message_success "Installed ${KEYBASE_PACKAGE_NAME}"
}

function keybase::internal::rsync::install {
    if ! type -p brew > /dev/null; then
        message_warning "${KEYBASE_MESSAGE_BREW}"
        return
    fi
    message_info "Installing rsync for ${KEYBASE_PACKAGE_NAME}"
    brew install rsync
    message_success "Installed rsync ${KEYBASE_PACKAGE_NAME}"
}

function keybase::internal::gpg::install {
    if ! type -p brew > /dev/null; then
        message_warning "${KEYBASE_MESSAGE_BREW}"
        return
    fi
    message_info "Installing dependences for ${KEYBASE_PACKAGE_NAME}"
    brew install gpg
    message_success "Installed dependences for ${KEYBASE_PACKAGE_NAME}"
}
