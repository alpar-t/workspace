#!/bin/bash


OUTDATED=$(brew outdated)
if [ -n "$OUTDATED" ] ; then
  terminal-notifier -title "Some Homebrew packages are outdated" -message "$OUTDATED" -sender com.apple.Terminal
fi
