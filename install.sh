#!/usr/bin/env sh

# installation script for CLASS (inside of a virtual env or conda env)

set -euxo

install_module(){
    if [ -n "${VIRTUAL_ENV-}" ]
    then
        install_path="${VIRTUAL_ENV}"
    elif [ -n "${CONDA_PREFIX-}" ]
    then
        install_path="${CONDA_PREFIX}"
    else
        printf 'No virtual env or conda env detected, aborting...\n'
        return 1
    fi
    make libclass.a && cp -a libclass.a "${install_path}/lib/" && cp -a ./include/*.h "${install_path}/include/"
}

install_module

set +euxo
