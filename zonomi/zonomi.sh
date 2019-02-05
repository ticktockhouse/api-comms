ZONOMI_API="https://zonomi.com/app/dns/dyndns.jsp"
ACTION=QUERY
DOMAIN=example.com
#DOMAIN=$1
API_KEY=${ZONOMI_KEY}


# Get domain records
GET_RECORDS="${ZONOMI_API}?action=${ACTION}&name=**.${DOMAIN}&api_key=${API_KEY}"



IP=46.101.62.113
HOST=webserver.flawless
ACTION=SET

ansible-playbook zonomi-playbook.yml

# transform the JSON...

jq '.actions[]' zonomi-api-result.json

#Set domain record
#URL="${ZONOMI_API}?action=${ACTION}&name=${HOST}.${DOMAIN}&value=${IP}&type=${TYPE}&api_key=${API_KEY}"
