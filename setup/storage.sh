#!/bin/sh

kubectl="$HOME/go/src/k8s.io/kubernetes/cluster/kubectl.sh"
PV_DIR=/test

$kubectl delete -f storage.yaml --ignore-not-found=true
sudo rm -rf $PV_DIR

for i in 01 02 03 04 05; do
  sudo mkdir -p $PV_DIR/$i
  sudo chmod 755 $PV_DIR/$i
done
$kubectl create -f storage.yaml
