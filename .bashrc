#! /bin/bash

encode() {
  echo -n $1 | base64
}

decode() {
  echo -n $1 | base64 -d
}

whereami() {
  kubectl config get-contexts | { head -1; grep '*'; }
}

update_kubeconfig() {
  export KUBECONFIG="${HOME}/.kube/config"
  for config in $(ls ${HOME}/.kube/*.json); do 
    export KUBECONFIG=$KUBECONFIG:$config; 
  done
}

alias k="kubectl"
alias gc="kubectl config get-contexts"
alias sc="kubectl config use-context"
alias sn="kubectl config set-context --current --namespace"
alias po="kubectl get pods"
alias svc="kubectl get services"
alias ing="kubectl get ingress"
alias pv="kubectl get pv"
alias pvc="kubectl get pvc"
alias de="kubectl get deployments"
alias sts="kubectl get statefulsets"
alias ns="kubectl get namespaces"
alias ds="kubectl get daemonsets"
alias wh="whereami"
alias uk="update_kubeconfig"
