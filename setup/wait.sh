#!/bin/sh

kubectl="$HOME/go/src/k8s.io/kubernetes/cluster/kubectl.sh"

while true; do
  echo "Waiting for cluster"
  sleep 3
  $kubectl get pod && break
done
echo "Cluster is up"
