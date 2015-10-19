#!/usr/bin/env bash

if ! conjur authn whoami &> /dev/null ; then
    conjur authn login
fi

if [ $(conjur resource exists variable:demo/secret_key) = false ]; then
    echo 'Creating demo variable'
    conjur variable create --as-group security_admin demo/secret_key $(date | md5)
fi

echo -e '
    The demo environment is ready.
    You may run the demo by running the following:
        $ \033[0;36mconjur env run node app\033[0m

    Then navigate to http://localhost:8080 in your browser.
    '