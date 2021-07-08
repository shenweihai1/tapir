cat client-* > client.log
cat client.log |ag 'Commit:'|cut -f1 -d ','| sed 's/# Commit: //'
