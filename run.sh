#!/bin/sh

# Initialize the LAST_IP variable as empty
LAST_IP=""
IP_CHANGED_MESSAGE_SHOWN=false


# Function to log messages with date
log() {
    local message=$1
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message"
}

# Function to check internet connectivity
check_internet() {
    ping -c 1 8.8.8.8 > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        log "ERROR: No Internet connection detected."
        return 1
    fi
    return 0
}

# Read specific values from the JSON file
ZONE_ID=$(jq -r '.credentials.zoneid' settings.json)
RECORD_ID=$(jq -r '.credentials.recordid' settings.json)
TOKEN=$(jq -r '.credentials.token' settings.json)
DEBUG=$(jq -r '.settings.debug' settings.json)
SLEEP_DURATION=$(jq -r '.settings.interval' settings.json)


log "Starting update DNS Record 🚀...."


while true; do
    # Check for internet connectivity
    if check_internet; then

    # Fetch the latest public IP
    PUBLIC_IP=$(curl -s http://ipinfo.io/ip)
    sleep $SLEEP_DURATION

        # Check if the IP has changed since the last update
        if [ "$PUBLIC_IP" != "$LAST_IP" ]; then
                
            # Modify the JSON
            UPDATED_DATA=$(jq --arg val "$PUBLIC_IP" '.data.content = $val | .data' settings.json)

            # Run curl command with environment variables
            RESPONSE=$(curl -sS -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
            -H "Authorization: Bearer $TOKEN" \
            -H "Content-Type: application/json" --data "$UPDATED_DATA")

            # Extract the value of the 'success' key
            SUCCESS=$(echo "$RESPONSE" | jq -r '.success')

            if [ "$SUCCESS" = "true" ]; then
                    # Reset the flag when IP changes
                    IP_CHANGED_MESSAGE_SHOWN=false  

                    # Only log $UPDATED_DATA if DEBUG is true
                    [ "$DEBUG" = "true" ] && log "$(printf '\n%s' "$UPDATED_DATA")"
                    log "Update successful with IP: $PUBLIC_IP"
                    # Store the latest updated IP
                    LAST_IP="$PUBLIC_IP"
                else
                    ERRORS=$(echo "$RESPONSE" | jq -r '.errors[]?.message')  # Extracts error messages
                    log "Update failed ❌"
                    [ -n "$ERRORS" ] && log "Error details: $ERRORS"
                fi
                
        else
            # Log the message only once until the IP changes
            if [ "$IP_CHANGED_MESSAGE_SHOWN" = "false" ]; then
                log "IP hasn't changed. No update required."
                IP_CHANGED_MESSAGE_SHOWN=true  # Set the flag after showing the message
            fi
        fi

    else
        sleep $SLEEP_DURATION
        continue;
    fi
    
done
