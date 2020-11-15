#!/usr/bin/env sh
# see https://stackoverflow.com/questions/40574589/why-does-container-doest-execute-scripts-inside-etc-my-init-d-on-startup/40595636
/usr/bin/envsubst < /home/app/webapp/nginx.tmpl > /etc/nginx/sites-enabled/nginx.conf || cat /etc/nginx/sites-enabled/nginx.conf
exit 0
