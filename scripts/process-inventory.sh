#!/bin/bash

echo "Sourcing .env file"
source .env

echo "Creating inventory.json using csvToJson.js"
node csvToJson.js

echo "Putting inventory.json in s3://$BUCKET_NAME/images/ using s3cmd"
s3cmd put inventory.json s3://$BUCKET_NAME/images/

echo "Syncing ../output/saved/ with s3://$BUCKET_NAME/images/"
s3cmd sync --skip-existing --delete-removed ../output/saved/ s3://$BUCKET_NAME/images/

echo "Setting acls to public for s3://$BUCKET_NAME/images/"
s3cmd setacl s3://$BUCKET_NAME/images/ --acl-public --recursive
