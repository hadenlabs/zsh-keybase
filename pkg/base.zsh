#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function keybase::dependences {
    message_info "Installing dependences for ${KEYBASE_PACKAGE_NAME}"
    message_success "Installed dependences for ${KEYBASE_PACKAGE_NAME}"
}

function keybase::core::validation {
    [ -z "${KEYBASE_PREFIX}" ] && message_warning "KEYBASE_PREFIX is neccesary"
}

# keybase::core::encrypt - encrypt
# filename file
# user user to encrypt
function keybase::core::encrypt {
    local filename user
    filename="${1}"
    user="${2}"
    if [ -z "${user}" ]; then
        user="$(keybase whoami)"
    fi
    keybase encrypt -b -i "${filename}" -o CHANGELOG."${KEYBASE_PREFIX}".rst "${user}"
}

# keybase::core::decrypt - decrypt
# filename file
# user user to decrypt
function keybase::core::decrypt {
    local filename user
    filename="${1}"
    user="${2}"
    if [ -z "${user}" ]; then
        user="$(keybase whoami)"
    fi
    keybase decrypt -b -i "${filename}" -o CHANGELOG."${KEYBASE_PREFIX}".rst "${user}"
}

function keybase::pgp::validation {
    [ -z "${GPG_SIGNING_KEY}" ] && message_warning "GPG_SIGNING_KEY is neccesary"
}

# keybase::pgp::public - public keybase
function keybase::pgp::public {
    keybase pgp export -q "${GPG_SIGNING_KEY}"
}

# keybase::pgp::private - private keybase
function keybase::pgp::private {
    keybase pgp export -q "${GPG_SIGNING_KEY}" --secret
}

# keybase::pgp::import - private and public key of keybase
function keybase::pgp::import {
    message_info "starting import keybase to gpg"
    keybase::pgp::public | gpg --import
    keybase::pgp::private| gpg --allow-secret-key-import --import
    message_success "finish import keybase to gpg"
}

function keybase::git::validation {
    [ -z "${GPG_SIGNING_KEY}" ] && message_warning "GPG_SIGNING_KEY is neccesary"
}

# keybase::git::signingkey - public keybase
function keybase::git::signingkey {
    git config --global user.signingkey "${GPG_SIGNING_KEY}"
    git config --global commit.gpgsign true
}
