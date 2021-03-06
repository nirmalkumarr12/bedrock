#!/bin/bash

cd /data/bedrock/src/www.mozilla.org-django

return_value=$(venv/bin/python bedrock/manage.py update_externalfiles --status)

if [ "$return_value" = "updated" ]; then
    # file was updated, deploy
    /data/bedrock/deploy www.mozilla.org-django/bedrock/bedrock/externalfiles/files_cache > /dev/null
    echo "Successfully updated externalfiles."
fi
