eval "$(/opt/homebrew/bin/brew shellenv)"
alias python=python3

# kubernetes
alias ku=kubectl
set-ns(){
	kubectl config set-context --current --namespace=$1
}

# podman - set machine for eib
pms (){
	podman machine stop && podman machine set --cpus 12 --memory 8192 \
	&& podman machine start && podman machine list
}

# to access Rancher UI in Nuremberg lab
alias ui="sshuttle -r root@xr11-1 192.168.100.0/24 --ssh-cmd 'ssh -i /Users/jiwonhu/.ssh/id_rsa'"

## eib 1.1
#EIB_DIR=~/eib-demo
EIB_DIR=~/bkup-eib-mgmt-single
alias eib="time podman run --privileged --rm -it -v $EIB_DIR:/eib  registry.opensuse.org/isv/suse/edge/edgeimagebuilder/containerfile-sp6/suse/edge-image-builder:1.1.0.rc2  build --definition-file eib-config.yaml"

alias eib-ele="time podman run --privileged --rm -it -v ~/elemental:/eib  registry.opensuse.org/isv/suse/edge/edgeimagebuilder/containerfile-sp6/suse/edge-image-builder:1.1.0.rc2  build --definition-file eib-config.yaml"

# eib 1.0
alias eib_10="podman run --privileged --rm -it -v ~/eib_quickstart/:/eib  registry.suse.com/edge/edge-image-builder:1.0.2  build --definition-file eib-config.yaml"

## SUSE Edge doc - compile locally before raising PR
doc(){
	podman run -it --rm -v /Users/jhu/suse-edge.github.io/:/docs/ registry.opensuse.org/home/atgracey/cnbp/containers/builder:latest bash -c 'cd /docs/asciidoc; daps -d DC-edge html'
	cd asciidoc/build/edge/html/edge; python -m http.server	
}

## GCP
alias stop-rancher="gcloud compute instances stop rancher-prime-1"
alias start-rancher="gcloud compute instances start rancher-prime-1"
