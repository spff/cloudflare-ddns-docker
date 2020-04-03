#!/bin/sh

# MY_DOMAIN='ms.exlent.io'
# CLOUDFLARE_RECORD_ID='123'
# CLOUDFLARE_EMAIL=''
# CLOUDFLARE_GLOBAL_API_KEY=''

NEW_IP=`nslookup myip.opendns.com resolver1.opendns.com | awk '/Address/ { print
$2 }' | tail -1`
CURRENT_IP=`nslookup $MY_DOMAIN | awk '/Address/ { print
$2 }' | tail -1`

if [ "$NEW_IP" = "$CURRENT_IP" ]
then
        echo "No Change in IP Adddress"
else
curl -X PUT "https://api.cloudflare.com/client/v4/zones/YOUR_ZONE_ID/dns_records/"$CLOUDFLARE_RECORD_ID \
     -H "X-Auth-Email: "$CLOUDFLARE_EMAIL \
     -H "X-Auth-Key: "$CLOUDFLARE_GLOBAL_API_KEY \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":$MY_DOMAIN,"content":"'$NEW_IP'","ttl":120,"proxied":false}' > /dev/null
echo $NEW_IP >> /tmp/ip_history.txt
fi