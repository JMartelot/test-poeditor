[![Build Status](https://travis-ci.org/JMartelot/test-poeditor.svg?branch=master)](https://travis-ci.org/JMartelot/test-poeditor)

# Poeditor integration.

Purpose of this project: test integration of poeditor with github and travis

Automatic import and export term to translate in several languages.


## Usage

First of all, in poeditor you must create url to use webhook and automatic import and export translation.

Configure your source language on your master branch with export term and translations only. And your target languages on your poeditor branch (see below) with import terms and translations.

You'll find this options in your project settings.

Next, in your travis configuration you must define the branch poeditor will be uses to commit new translations. (Travis wont build when commit will be done on this branch)

*Exemple :*

```
branches:
  except:
    - poeditor
```

In the `scripts/poeditor.sh` you need to define several variables.

  - `POEDITOR_BRANCH` correspond to the branch where poeditor will commit new translations
  - `LANGUAGES` correspond to the app target languages
  - `API_TOKEN` is the poeditor token. You can find it in your account under **API Access** tab.
  - `PROJECT_ID` is the project id for which you want implement automatic translation.

Thats' all, you are ready to automatically translate your project.

Enjoy!