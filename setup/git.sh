#!/bin/bash

kubectl="$HOME/go/src/k8s.io/kubernetes/cluster/kubectl.sh"

$kubectl apply -f gitd.yaml
sleep 5
$kubectl exec gitd -- /bin/sh -c "/git/add_git_user.sh $USER \"`cat id_rsa.pub`\""
ssh 127.0.0.1 -p 30884 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "init demo.git"
GIT_DIR=content/.git git push origin master:master
GIT_DIR=content/.git git push origin v1.0:v1.0
