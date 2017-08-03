#!/bin/sh

#Synchronise terms and translations between poeditor and github
curl https://poeditor.com/api/webhooks/github?api_token=be16af5e4c263251da66a8efcabb1182&id_project=122575&language=en&operation=sync_terms_and_translations&overwrite_translations=1