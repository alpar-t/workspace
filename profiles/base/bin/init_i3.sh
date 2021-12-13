#!/bin/bash
i3-msg "workspace 1; append_layout $HOME/.i3/w1_layout.json"
i3-msg "workspace 2; append_layout $HOME/.i3/w2_layout.json"
i3-msg "workspace 3; append_layout $HOME/.i3/w3_layout.json"
i3-msg "workspace 4; append_layout $HOME/.i3/w4_layout.json"
i3-msg "workspace 5; append_layout $HOME/.i3/w5_layout.json"
i3-msg "workspace 2;exec run-on-ac intellij-idea-ultimate-edition"
i3-msg "workspace 1; exec chromium"
sleep 3
i3-msg "workspace 5;exec chromium --app=\"https://web.whatsapp.com\""
i3-msg "workspace 5;exec chromium --app=\"https://elastic.slack.com\""
i3-msg "workspace 4;exec chromium --app=\"https://mail.google.com/mail/u/1/#inbox\""
i3-msg "workspace 3;exec xfce4-terminal"
i3-msg "workspace 1"


