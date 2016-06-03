#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "exec chromium; exec idea.sh; exec pidgin"
sleep 2
i3-msg "exec skype; exec HipChat4"

