#!/bin/sh

#Import new terms from github
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=en&operation=import_terms_and_translations"

#Compare local translation file with master translation file
DIFF=`git diff master:locales/fr/translation.json -- locales/fr/translation.json`

#Get translations if we don't have them
if [[ ! -z $DIFF ]]
then
    echo 'New translations'

    #Update translations files for other languages than default one (English)
    curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=fr&operation=export_terms_and_translations"
fi