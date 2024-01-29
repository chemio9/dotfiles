#!/usr/bin/env bash
# TODO: select screenshot mode: save to file / copy
grim -g "$(slurp)" /dev/stdout|wl-copy
