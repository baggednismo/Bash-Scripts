#!/bin/bash

###################################################################################
# This script will create a new laravel project in the specified projects folder. #
# Material Dashboard will also be installed and configured.                       #
###################################################################################

BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
PROJECTPATH='/Users/devin/projects/'

echo -e "${BLUE}Creating new project: ${PROJECTPATH}$1${NC}"
#create the project in our project folder
cd ${PROJECTPATH}
composer create-project --prefer-dist laravel/laravel $1

echo -e "${BLUE}Installing material dashboard in $1${NC}"
cd ${PROJECTPATH}$1
composer require laravel-frontend-presets/material-dashboard

echo -e "${BLUE}Setting material preset in $1${NC}"
php artisan preset material

echo -e "${BLUE}dumping composer autoload${NC}"
composer dump-autoload

echo -e "${BLUE}Copying the example .env${NC}"
cp ${PROJECTPATH}$1/.env.example ${PROJECTPATH}$1/.env

echo -e "${BLUE}Installation is complete.\nCreate your DB if you dont already have one.${NC}"

echo -e "${BLUE}Once your .env is configured correctly dont forget\nto run: ${RED}php artisan migrate --seed${NC}"

code ${PROJECTPATH}$1