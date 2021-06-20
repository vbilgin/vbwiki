#!/bin/sh
USER=victor
HOST=victorbilgin.com
DIR=/var/www/wiki.victorbilgin.com/html

hugo && rsync -avz --delete public/ ${USER}@${HOST}:${DIR}

exit 0