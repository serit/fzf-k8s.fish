<div align="center">

# fzf-k8s.fish 🐟

</div>

## Search kubernetes resources
Extends [patrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish) with a kubernetes layer, to enable fzf search for all api resources on a cluster.  

<p align="center"><img src="/img/fzf-k8s.gif?raw=true"/></p>

## Installation
**very wip**
1. Use a fish plugin manager like [fisher](https://github.com/jorgebucaran/fisher) to install [patrickf1/fzf.fish](https://github.com/PatrickF1/fzf.fish)  
    See [installation instructions](https://github.com/PatrickF1/fzf.fish?tab=readme-ov-file#installation)

1. Install fzf-k8s.fish
    ```
    fisher install serit/fzf-k8s.fish
    ```

1. bind e.g ctrl+alt+k to auto search (put in your fish configuration)
   ``` 
   bind \e\ck _fzf_k8s_auto_search
   bind \e\ck _fzf_k8s_auto_search --mode insert 
   ```
   It is also possible to directly bind a resource with c+f to search pods
   ```
   bind \cf --mode insert "_fzf_k8s_search_resource pods"
   bind \cf "_fzf_k8s_search_resource pods"
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


## improvements
- Auto search should add the api-resource if only `kubectl get/logs/port-forward` is run, e.g `<api-resource>/<resource>`
- Better parsing of commandline to handle flags like `--namespace`, and don't assume the resource will be at argv[3], e.g `kubectl get --namespace test pods`
