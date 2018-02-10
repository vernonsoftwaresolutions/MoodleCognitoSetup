#!/bin/bash

#############################
# Manual Steps
# 1. Create App client 
# 2. Enable Cognito User Pool under App Client Settings
#############################

DOMAIN=$1
USER_POOL=$2
CLIENT_ID=$3
CALLBACK_URL=$4

aws cognito-idp update-user-pool-client --user-pool-id $USER_POOL \
--client-id $CLIENT_ID --allowed-o-auth-flows-user-pool-client \
--allowed-o-auth-flows "code" --allowed-o-auth-scopes "openid" "phone" "email" "aws.cognito.signin.user.admin" "profile" \
--callback-urls $CALLBACK_URL

aws cognito-idp create-user-pool-domain --domain $DOMAIN --user-pool-id $USER_POOL

# aws cognito-idp set-ui-customization --user-pool-id <your-user-pool-id> --client-id <your-app-client-id> --image-file <path-to-logo-image-file> --css ".label-customizable{ color: <color>;}"

#############################
# Create Accounts Server
#
#############################
aws cognito-idp create-resource-server --user-pool-id $USER_POOL  --identifier com.moodle.accounts --name "Moodle Accounts API" \
--scopes ScopeName="accounts.read",ScopeDescription="GET Accounts API" \
ScopeName="accounts.write",ScopeDescription="POST Accounts API" \
ScopeName="accounts.read.email",ScopeDescription="GET Accounts by email API" \
ScopeName="accounts.delete",ScopeDescription="DELETE Accounts API" 

aws cognito-idp create-resource-server --user-pool-id $USER_POOL  --identifier com.moodle.sites --name "Moodle Sites API" \
--scopes ScopeName="sites.read",ScopeDescription="GET Sites API" \
ScopeName="sites.write",ScopeDescription="POST Sites API" \
ScopeName="sites.delete",ScopeDescription="DELETE Sites API"


