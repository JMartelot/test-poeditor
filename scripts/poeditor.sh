#!/bin/sh

#Import new terms from github into poeditor
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=en&operation=import_terms_and_translations"

POEDITOR_BRANCH='test'

if [ ! `git branch --list $POEDITOR_BRANCH` ]
then
    echo "Create $POEDITOR_BRANCH branch"
    git branch $POEDITOR_BRANCH
fi

#Switch branch
git checkout $POEDITOR_BRANCH

#Get translations into poeditor branch
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=fr&operation=export_terms_and_translations"

#Compare translations files on poedtior branch with master 
DIFF=`git diff master:locales/fr/translation.json -- locales/fr/translation.json`

#If there is difference between translation files update them
if [[ ! -z $DIFF ]]
then
    echo 'New translations'
    
    git add locales/fr/translation.json
    git commit -m "Add translation for fr language"

fi