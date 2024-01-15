#!/bin/bash

# Set Terraform Enterprise variable using TFE API
TFE_TOKEN= "tNNiUTsRuHNj8Q.atlasv1.PVBnIzPamPr04bpJI6zGmNlPm67zJE77914yeyl3pEaf83aKaw7nRk8rS83BYWOfjU8"
TFE_ORG= "Practise_terraform"
VARIABLE_NAME="Test"
VARIABLE_VALUE="123"

# Create or update the variable
curl -s --header "Authorization: Bearer $TFE_TOKEN" \
     --header "Content-Type: application/vnd.api+json" \
     --request PATCH \
     --data @- \
     "https://app.terraform.io/api/v2/vars/$TFE_ORG/$VARIABLE_NAME" <<EOF
{
  "data": {
    "type": "vars",
    "id": "$TFE_ORG/$VARIABLE_NAME",
    "attributes": {
      "value": "$VARIABLE_VALUE"
    }
  }
}
EOF

