#!/bin/bash

# Set Terraform Enterprise variable using TFE API
TFE_TOKEN= "MVND97ap0tLvnA.atlasv1.ikO86FefeRKonHDDQS8mvD8zVd9LmzyBrhOnABp9Cnm9zbrDYzsLnrTDDdPpLLfhzZE"
TFE_ORG= "Practise_terraform"
VARIABLE_NAME="Test"
VARIABLE_VALUE="123"

# Create or update the variable
curl -s --header "Authorization: Bearer $TFE_TOKEN" \
     --header "Content-Type: application/vnd.api+json" \
     --request POST\
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

