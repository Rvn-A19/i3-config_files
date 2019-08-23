#!/bin/bash

touchoff() {
  xinput disable `xinput list | grep Touch | cut -f2 | cut -f2 -d=`
}


if [ "`xinput list | grep Mouse`" ]; then
  touchoff
fi

