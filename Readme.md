[![Build Status](https://travis-ci.org/JMartelot/test-poeditor.svg?branch=master)](https://travis-ci.org/JMartelot/test-poeditor)

# Poeditor integration.

Purpose of this project: test integration of poeditor with github and travis

Automatic import and export term to translate in several languages.


## Usage

First of all, in poeditor you must create url to use webhook and automatic import and export translation.

You'll find this options in your project settings.

Next, in your travis configuration you must define the branch poeditor will be uses to commit new translations. (Travis wont build when commit will be done on this branch)

*Exemple :*

```
branches:
  except:
    - poeditor
```

In the `scripts/poeditor.sh` file edit the variable `POEDITOR_BRANCH` to correspond to what you have define in the travis configuration.

To finish define the languages you want to updated automatically in github, with the var `LANGUAGES`.

You are ready to automatically translate your porject.

Enjoy!