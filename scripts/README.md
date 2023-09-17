# Stable Diffusion WebUI Scripts

The purpose of this scripts folder is to help out with periodical tasks to update a website. You can run `yarn start` and the default commands will run to sync the latest saved folder to an S3 bucket defined in the `.env` file, generate the inventory.json file, and then set the acls to public.

## Requirements
1. `.env` bucket name set
2. `s3cmd` cli configured correctly with appropriate IAM credentials set
3. Supported NodeJS version. Preferably installed via nvm.

## Running

### Ensure Node.JS is installed
```bash
$ nvm list

->     v18.17.1
default -> 18 (-> v18.17.1)
```

### Install dependencies
```bash
$ yarn
```

### Create .env file
```bash
$ cp .env.example .env
```

### Set bucket name in .env file
```bash
$ cat .env

BUCKET_NAME=YOUR_BUCKET_HERE
```

### Run the progream
```bash
$ yarn start
```