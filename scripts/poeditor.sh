#!/bin/sh

#Import new terms from github
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=en&operation=import_terms_and_translations"

#Update translations files for other languages than default one (English)
curl "https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=fr&operation=export_terms_and_translations"