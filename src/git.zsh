#!/usr/bin/env ksh
# -*- coding: utf-8 -*-
function keybase::git::validation {
    [ -z "${GPG_SIGNING_KEY}" ] && message_warning "GPG_SIGNING_KEY is neccesary"
}

# keybase::git::signingkey - public keybase
function keybase::git::signingkey {
    git config --global user.signingkey "${GPG_SIGNING_KEY}"
    git config --global commit.gpgsign true
}
