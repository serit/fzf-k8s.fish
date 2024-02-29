<div align="center">

# fzf-k8s.fish 🐟

</div>

## Search kubernetes resources
Extends [patrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish) with a kubernetes layer, to enable fzf search for all api resources on a cluster.  

## Installation
**very wip**
1. Use a fish plugin manager like [fisher](https://github.com/jorgebucaran/fisher) to install [patrickf1/fzf.fish](https://github.com/PatrickF1/fzf.fisk)  

1. Install fzf-k8s.fish
    ```
    fisher install serit/fzf-k8s.fish
    ```

1. bind e.g ctrl+alt+k to auto search (put in your fish configuration)
    ``` 
    bind \e\ck _fzf_k8s_auto_search
    bind \e\ck _fzf_k8s_auto_search --mode insert 
    ```


## Usage
After binding auto search, use it with e.g  
    ```
    kubectl get <fzf-k8s>
    ```
or  
    ```
    kubectl get pods <fzf-k8s>
    ```
Auto search will first give you a list of all api-resources available on the cluster. If you've already specified a resource in the commandline, 
it will jump straight to that resource.



