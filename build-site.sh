#!/bin/bash

BAD_ZIP="$1"

echo "/ /$BAD_ZIP" >_redirects
echo -e "/$BAD_ZIP\n  Content-Disposition: attachment; filename=$BAD_ZIP" >_headers

rm site.zip 2>/dev/null
zip -r9 site.zip "$BAD_ZIP" _redirects _headers
unzip -l site.zip
