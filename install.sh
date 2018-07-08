#!/usr/bin/env bash
cp ./.vimrc ~/
echo 'Copied repo .vimrc to home directory'
vim +'PlugInstall --sync' +qa
echo 'Installed Vim plugins'
cp ./.tmux.conf ~/
echo 'Copied repo .tmux.conf to home directory'
