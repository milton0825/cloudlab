#!/bin/bash

sudo apt --assume-yes update
sudo apt --assume-yes upgrade
yes '' | sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt --assume-yes install golang-go tmux git
