#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

# validate file exist
function keybase::internal::file::exists {
    local filename
    filename="${1}"
    if [ ! -e "${filename}" ]; then
        message_warning "File ${filename} doesn't exists."
        return
    fi
}

# get extension of file
function keybase::internal::file::extension {
    local extension filename
    filename="${1}"
    keybase::internal::file::exists "${filename}"
    extension="$(echo "${filename}" | awk -F . '{if (NF>1) {print $NF}}')"
    if [ -n "${extension}" ]; then
        echo ".${extension}"
    fi
}

# get name of file
function keybase::internal::file::name {
    local filename basefile extension
    filename="${1}"
    keybase::internal::file::exists "${filename}"
    extension="$(keybase::internal::file::extension "${filename}")"
    basefile="$(basename "${filename}" "${extension}")"
    echo "${basefile}"
}

# convert string to slug
function keybase::internal::string::slug {
    local data
    data="${1}"
    echo "${data}" | sed -e 's/[^a-zA-Z0-9._-]/-/g'
}

# get file slug
function keybase::internal::file::slug {
    local file filename
    file="${1}"
    keybase::internal::file::exists "${file}"
    filename=$(keybase::internal::string::slug "${file}")
    keybase::internal::string::slug "${filename}"
}

# show value for uuid
function keybase::internal::uuid::value {
    openssl rand -hex 4
}

# Defines convert file to newfile.
function keybase::internal::file::convert {
    local file filename extension slugname responsefile
    file="${1}"
    keybase::internal::file::exists "${file}"
    filename=$(keybase::internal::file::name "${file}")
    uuid=$(keybase::internal::uuid::value)
    extension=$(keybase::internal::file::extension "${file}")
    slugname="$(keybase::internal::string::slug "${filename}").${KEYBASE_PREFIX}.${uuid}"
    responsefile="${slugname}${extension}"
    echo "${responsefile}"
}


# keybase::internal::encrypt - encrypt
# filename file
# user user to encrypt
function keybase::internal::encrypt {
    local filename user newFilename
    filename="${1}"
    user="${2}"
    if [ -z "${user}" ]; then
        user="$(keybase whoami)"
    fi
    keybase::internal::file::exists "${filename}"
    newFilename="$(keybase::internal::file::convert ${filename})"
    keybase encrypt -b -i "${filename}" -o "${newFilename}" "${user}"
}

# keybase::internal::decrypt - decrypt
# filename file
# user user to decrypt
function keybase::internal::decrypt {
    local filename user extension name_orig
    file="${1}"
    user="${2}"
    keybase::internal::file::exists "${file}"
    extension=$(keybase::internal::file::extension "${file}")
    name_orig=$(echo "${file}" | sed -e "s/${KEYBASE_PREFIX}.//" | sed -e "s/${extension}//" | sed -e 's/\.[^\.]*$//')
    keybase decrypt -i "${file}" -o "${name_orig}${extension}"
}
