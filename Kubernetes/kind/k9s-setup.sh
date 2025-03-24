#!/bin/bash
wget https://github.com/derailed/k9s/releases/download/v0.25.5/k9s_Linux_x86_64.tar.gz
tar -xvzf k9s_Linux_x86_64.tar.gz
sudo mv k9s /usr/local/bin/
k9s --version

