#!/bin/bash

if brew outdated | grep .; then
  osascript -e 'display notification "Some Homebrew packages are outdated!" with title "Brew Reminder"'
fi
