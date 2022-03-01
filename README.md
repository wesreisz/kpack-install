### Install Carvel
Install the Carvel tools manually (or using Homebrew/Chocolatey):

You will need to download the Carvel CLI tools and rename them as well as add them to your PATH:

kapp.exe: https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-windows-amd64.exe
ytt.exe: https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.38.0/ytt-windows-amd64.exe
vendir.exe: https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-windows-amd64.exe

```
kapp version
ytt version

vendir version
```

Execute `download-dependencies.sh` to pull down the binaries and files you need.

Check `kp` and `yq` versions.
```
kp version
yq --version
```

Install kpack by executing `install-kpack.sh`

Check builder, clusterstore, and  clusterstore
```
kp builder list
kp clusterstore list
kp clusterstack list
```

Create image for build
```
apiVersion: kpack.io/v1alpha2
kind: Image
metadata:
  name: weatherforecast-service-api
  namespace: default
spec:
  tag: harbor.wesleyreisz.com/kpack/weatherforecast-service-api-1
  #additionalTags:
  #- harbor.wesleyreisz.com/rrsc/spring-petclinic:nightly
  serviceAccountName: kpack-service-account
  builder:
    name: builder
    kind: Builder
  source:
    git:
      url: https://bitbucket.org/wesreisz/weatherforecast-kpack.git
      revision: main
    subPath: src/weatherforecast-service/
```

Apply it
```
kubectl apply -f  image-weatherforecast-service-api.yaml
```

Watch the logs
```
kp build logs weatherforecast-service-api
```