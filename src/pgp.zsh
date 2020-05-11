#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

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
