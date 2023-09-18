#!/bin/bash

echo "Sourcing .env file"
source .env

echo "Syncing ../output/saved/ with s3://$BUCKET_NAME/images/"
s3cmd sync --acl-public --skip-existing --delete-removed ../output/saved/ s3://$BUCKET_NAME/images/

echo "Creating inventory.json using csvToJson.js"
node csvToJson.js

echo "Putting inventory.json in s3://$BUCKET_NAME/images/ using s3cmd"
s3cmd put --acl-public inventory.json s3://$BUCKET_NAME/images/
