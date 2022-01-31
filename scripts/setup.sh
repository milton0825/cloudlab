#!/bin/bash

sudo apt --assume-yes update
sudo apt --assume-yes upgrade
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt --assume-yes install golang-go tmux git
