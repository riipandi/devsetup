#!/bin/bash

pwddir=$(dirname "$(readlink -f "$0")")
parent=$(dirname $pwddir)

mkdir -p $HOME/.config/Code/User
cat $parent/configs/vscode-settings.json > $HOME/.config/Code/User/settings.json

# Base extensions
code --install-extension geeebe.duplicate
code --install-extension shanoor.vscode-nginx
code --install-extension dracula-theme.theme-dracula
code --install-extension PKief.material-icon-theme
code --install-extension EditorConfig.EditorConfig
code --install-extension formulahendry.auto-close-tag
code --install-extension davidanson.vscode-markdownlint
code --install-extension yzhang.markdown-all-in-one
code --install-extension HookyQR.beautify
code --install-extension wwm.better-align
code --install-extension brenosolutions.sqlformatter
code --install-extension dotjoshjohnson.xml
code --install-extension pnp.polacode
code --install-extension formulahendry.code-runner
code --install-extension PeterJausovec.vscode-docker
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension eamodio.gitlens

# PHP development
code --install-extension robinbentley.sass-indented
code --install-extension felixfbecker.php-debug
code --install-extension felixfbecker.php-intellisense
code --install-extension junstyle.php-cs-fixer

# Laravel Vue development
code --install-extension onecentlin.laravel-blade
code --install-extension onecentlin.laravel-extension-pack
code --install-extension onecentlin.laravel5-snippets
code --install-extension ryannaddy.laravel-artisan
code --install-extension eg2.vscode-npm-script
code --install-extension mikestead.dotenv
code --install-extension octref.vetur
code --install-extension shekhardtu.vuejspack

# React Native development
code --install-extension vsmobile.vscode-react-native
