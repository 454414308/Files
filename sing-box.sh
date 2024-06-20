#!/bin/bash
curl -Lo sing-box.deb "https://github.com/454414308/Files/blob/main/sing-box_1.9.0_linux_amd64.deb"
sudo dpkg -i sing-box.deb
rm sing-box.deb

