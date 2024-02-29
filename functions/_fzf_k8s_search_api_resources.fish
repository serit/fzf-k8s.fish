function _fzf_k8s_search_api_resources.fish --description "Search api-resources on the current kubernetes cluster"
    set -f k_cmd (command -v kubectl || "kubectl")
    set -f k_preview_fmt "kubectl api-resources"
    set -f api_resource_selected (
      $k_cmd api-resources -oname  | \
      _fzf_wrapper --multi \
        --prompt="Api-resources> " \
        --query (commandline --current-token) \
        --ansi \
        --header-lines=1 \
        #--preview="$k_cmd get '$k_preview_fmt' -p {1} || echo 'Cannot get {1}'" \
        --preview="$k_cmd get {1}" \
        --preview-window="right:100:wrap" \
        $fzf_k8s_api_resources_opts
    )
    commandline --function repaint
end
