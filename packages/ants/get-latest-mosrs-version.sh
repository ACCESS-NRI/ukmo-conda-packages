#!/bin/bash

set -e

url=https://code.metoffice.gov.uk/svn/ancil/ants/
# Get SVN property fcm:revision
props=$(svn propget fcm:revision $url)

# Get the latest prop 
# The latest prop is identified based on the highest revision number 
# (right-hand side of the equal sign in the prop string)
# and including only numerical versions (left-hand side of the equal 
# sign in the prop string) (e.g., '2024.22.1', '1.2', 'v1.2', 'vn1.2').
latest_prop=$(echo "$props" | grep -E '^(vn?)?[0-9]' | sort -t= -k2,2n | tail -n1)
# The latest revision is the right-hand side (stripped of blanks)
latest_revision=$(echo "$latest_prop" | cut -d= -f2 | xargs)
# The latest revision is the left-hand side (stripped of blanks)
latest_version=$(echo "$latest_prop" | cut -d= -f1 | xargs)
# Remove any leading 'v' or 'vn' from the version
latest_version=${latest_version#v}
latest_version=${latest_version#n}
echo "$latest_version $latest_revision"