#!/usr/bin/env sh

# installation script for CLASS (inside of a virtual env or conda env)

set -eux

install_module(){
    if [ -n "${VIRTUAL_ENV-}" ]
    then
        install_path="${VIRTUAL_ENV}"
    elif [ -n "${CONDA_PREFIX-}" ]
    then
        install_path="${CONDA_PREFIX}"
    else
        # we hope that this exists
        if stat "/usr/local" >/dev/null 2>&1
        then
            install_path="/usr/local"
        else
            install_path="/usr"
        fi
    fi
    make libclass.a
    cp -a libclass.a "${install_path}/lib/"
    cp -a ./include/*.h "${install_path}/include/"
}

install_module

set +eux
