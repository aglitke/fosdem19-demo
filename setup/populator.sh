#!/bin/bash

kubectl="$HOME/go/src/k8s.io/kubernetes/cluster/kubectl.sh"
POPULATOR_DIR=$HOME/go/src/github.com/j-griffith/populator

export KUBECONFIG=
export KUBERNETES_PROVIDER=local

pushd $HOME/go/src/k8s.io/kubernetes
cluster/kubectl.sh config set-cluster local --server=https://localhost:6443 --certificate-authority=/var/run/kubernetes/server-ca.crt
cluster/kubectl.sh config set-credentials myself --client-key=/var/run/kubernetes/client-admin.key --client-certificate=/var/run/kubernetes/client-admin.crt
cluster/kubectl.sh config set-context local --cluster=local --user=myself
cluster/kubectl.sh config use-context local
popd

$kubectl apply -f $POPULATOR_DIR/kubernetes/crd.yaml

$POPULATOR_DIR/bin/populator-controller -kubeconfig $HOME/.kube/config
