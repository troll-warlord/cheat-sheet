fpath+=/opt/homebrew/share/zsh/site-functions
autoload -Uz compinit && compinit
plugins=(git)

# Enable vcs_info for Git branch info
autoload -Uz vcs_info
precmd() { vcs_info }

# Configure vcs_info to show Git branch in format "(branch-name)"
zstyle ':vcs_info:git:*' formats '(%b)'

# Make sure prompt evaluates vcs_info message
setopt prompt_subst
PROMPT='%F{green}%n@%m%f %F{cyan}%~%f %F{yellow}${vcs_info_msg_0_}%f %# '

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
