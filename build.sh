#!/bin/bash
#
build () {
  pushd $1
  if [ -f ./configure ]; then
          ./configure $2 && make
  else
          autoreconf -i -m &&  ./configure $2 && make
  fi
  if [ $? != 0 ]
  then
          echo build failed
          exit
  fi
  popd
}

build HyperDex --enable-python-bindings $*
