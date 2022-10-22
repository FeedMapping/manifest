#!/bin/bash

# Update packages database
pacman -Syu --noconfirm

# Installing git package
pacman -S --noconfirm git

# Installing ruby libraries
pacman -S --noconfirm ruby3.1.2 ruby-bundler

# Setting default ruby version
cp /usr/bin/ruby-3.1.2 /usr/bin/ruby

# debug
ruby -v && bundle version

# This is a temporary workaround
# See https://github.com/actions/checkout/issues/766
git config --global --add safe.directory "*"
