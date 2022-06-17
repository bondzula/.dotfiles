#!/usr/bin/env bash
# selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
# if [[ -z $selected ]]; then
#     exit 0
# fi
#
# read -p "Enter Query: " query
#
# if grep -qs "$selected" ~/.tmux-cht-languages; then
#     query=`echo $query | tr ' ' '+'`
#     tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query | bat -p --paging=always"
# else
#     tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
# fi

read -p "Enter Language: " selected
read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`

echo "curl cht.sh/$selected/$query/" & curl cht.sh/$selected/$query | bat -p --paging=always
