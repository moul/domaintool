#!/bin/sh

set -x

while true; do export HOST=dev.onouo.com; node-dev app.coffee ; sleep 1; done
