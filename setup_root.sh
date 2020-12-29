#!/bin/bash
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubectx_v0.9.1_linux_x86_64.tar.gz
tar -xzf kubectx_v0.9.1_linux_x86_64.tar.gz 
mv kubectx /usr/local/bin/kubectx

wget https://github.com/ahmetb/kubectx/releases/download/v0.9.1/kubens_v0.9.1_linux_x86_64.tar.gz
tar -xzf kubens_v0.9.1_linux_x86_64.tar.gz 
mv kubens /usr/local/bin/kubens

rm kubens_v0.9.1_linux_x86_64.tar.gz 
rm kubectx_v0.9.1_linux_x86_64.tar.gz 
