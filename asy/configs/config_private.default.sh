#!/bin/sh

[ -f 'config_private.asy' ] || \
cat <<EOF >config_private.asy
string asy_home="${HOME}/.config/asy";
EOF
