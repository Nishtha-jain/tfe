#!/bin/bash
WORKSPACE_ID="ws-NoYPyMHoX2HwQ7vb"
TFE_HOST="app.terraform.io"
TFE_TOKEN="7eCGzXnzGJi1qg.atlasv1.1XoeWzc91ggZddIBZVzhEnT6JeZRJr928WgeTX8hXcFEb80HN0ky0Qruw7laqTmlBOg"
variable_keys=("FName", "LName", "Age")
value=("Nishtha", "jain", "26")

function workspace_variable_create() {
        echo -e "\n$HORIZONTALLINE"
        echo -e "CREATING ${key} KEY AND ITS VALUE IS ${value[i]} IN ${TFE_WORKSPACE}: ${WORKSPACE_ID}"
        echo -e "$HORIZONTALLINE"
        echo '
        {
                "data": {
                        "type":"vars",
                        "attributes": {
                                "key":"'${key}'",
                                "value":"'${value[i]}'",
                                "description":"Create variable through API",
                                "category":"terraform",
                                "hcl":false,
                                "sensitive":false
                        },
                        "relationships": {
                                "workspace": {
                                        "data": {
                                                "id":"'$WORKSPACE_ID'",
                                                "type":"workspaces"
                                        }
                                }
                        }
                }
        }' > create_vars.json
        # Call the API to create the variables
        curl -k -s \
                --header "Authorization: Bearer $TFE_TOKEN" \
                --header "Content-Type: application/vnd.api+json" \
                --request POST \
                --data @create_vars.json \
                https://$TFE_HOST/api/v2/vars 

        
        echo -e "\n$HORIZONTALLINE"
        echo -e "VARIABLES ${key} CREATED IN THE $TFE_WORKSPACE SUCCESSFULLY"
        echo -e "$HORIZONTALLINE"
}

function workspace_variable_update() {
        echo -e "\n$HORIZONTALLINE"
        echo -e "UPDATING ${key} KEY AND ITS VALUE IS ${value[i]} IN VAR ID ${VARIABLE_ID}"
        echo -e "$HORIZONTALLINE"
        echo '{
                "data": {
                        "id": "'${VARIABLE_ID}'",
                        "type": "vars",
                        "attributes": {
                                "key": "'${key}'",
                                "value": "'${value[i]}'",
                                "sensitive": false,
                                "category": "terraform",
                                "hcl": false,
                                "created-at": "2021-03-17T19:34:13.655Z",
                                "description": "Update variables through API"
                        }
                }
        }' > variable_update.json

        # Call the API to update the variables
        curl -k -s \
                --header "Authorization: Bearer $TFE_TOKEN" \
                --header "Content-Type: application/vnd.api+json" \
                --request PATCH \
                --data @variable_update.json \
                https://$TFE_HOST/api/v2/vars/${VARIABLE_ID}

        echo -e "\n$HORIZONTALLINE"
        echo -e "VARIBLES ${key} UPDATED IN TFE SUCCESSFULLY"
        echo -e "$HORIZONTALLINE"
}

# Updating variable
i=0
for key in "${variable_keys[@]}";do
workspace_variable_create
i=$((i+1))
done
