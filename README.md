### Install Carvel
Install the Carvel tools manually (or using Homebrew/Chocolatey):

You will need to download the Carvel CLI tools and rename them as well as add them to your PATH:

kapp.exe: https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-windows-amd64.exe
ytt.exe: https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.38.0/ytt-windows-amd64.exe
vendir.exe: https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-windows-amd64.exe

```
kapp version
> kapp version 0.45.0

ytt version
> ytt version 0.38.0

vendir version
```

Execute `download-dependencies.sh` to pull down the binaries and files you need.