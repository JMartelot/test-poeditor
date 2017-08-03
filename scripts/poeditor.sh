#!/bin/bash

#You must customize this variables according your project, see readme.md for more details.
#POEditor Token API
API_TOKEN='be16af5e4c263251da66a8efcabb1182'
#POEditor project id
PROJECT_ID='122575'
#Branch name where commit are done to add new translation by poeditor
POEDITOR_BRANCH='poeditor'
#Array of all languages available in the application and configured in poeditor
LANGUAGES=(fr es)

#Import new terms from github into poeditor
curl "https://poeditor.com/api/webhooks/github?api_token=$API_TOKEN&id_project=$PROJECT_ID&language=en&operation=import_terms_and_translations"

if [ ! `git branch --list $POEDITOR_BRANCH` ]
then
    echo "Create $POEDITOR_BRANCH branch"
    git branch $POEDITOR_BRANCH
fi

#Switch branch
git checkout $POEDITOR_BRANCH

#Loop over each languages
for LANGUAGE in ${LANGUAGES[@]}
do
    #Get translations into poeditor branch
    curl "https://poeditor.com/api/webhooks/github?api_token=$API_TOKEN&id_project=$PROJECT_ID&language=$LANGUAGE&operation=export_terms_and_translations"
done

