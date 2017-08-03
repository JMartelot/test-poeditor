#!/bin/sh

#Import new terms from github
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=en&operation=import_terms_and_translations"

#Store current branch name to compare translations file later
BRANCH=`git symbolic-ref --short HEAD`

COMPAREBRANCH='poeditor-integration'

#Switch branch
git checkout -b $COMPAREBRANCH

#Get translations
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=fr&operation=export_terms_and_translations"

#Compare new translation file with branch to merge
DIFF=`git diff $BRANCH:locales/fr/translation.json -- locales/fr/translation.json`

#Get back to current branch 
git checkout $BRANCH 

#Delete branch used to compare translations file
git branch -D $COMPAREBRANCH

#If there is difference between translation files update them
if [[ ! -z $DIFF ]]
then
    echo 'New translations'

    #Update translations files for other languages than default one (English)
    curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=fr&operation=export_terms_and_translations"
fi