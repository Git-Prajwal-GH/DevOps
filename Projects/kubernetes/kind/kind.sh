#!/bin/bash

##This will install the kind with specific version

###https://kind.sigs.k8s.io/docs/user/quick-start/#installation

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

## To get the specific version:-- https://github.com/kubernetes-sigs/kind/releases
#######command to create kind using image
### currently using 1.29 version
kind create cluster --image kindest/node:v1.29.10@sha256:3b2d8c31753e6c8069d4fc4517264cd20e86fd36220671fb7d0a5855103aa84b --name cka-cluster-2 --config kind-example-config.yaml


## to get the nodes
kubectl get nodes

## to set the context
kubectl config get-contexts

## to use the context
#kubectl config use-context <cluster name>


