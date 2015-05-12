#!/bin/bash

i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "workspace 1; exec skype"
i3-msg "workspace 1; exec chromium"
i3-msg "workspace 3; append_layout $HOME/.i3/w3_layout.json"

