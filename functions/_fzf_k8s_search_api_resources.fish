function _fzf_k8s_search_api_resources --description "Search api-resources on the current kubernetes cluster"
    set -f k_cmd (command -v kubectl || "kubectl")
    set -f k_preview_fmt "kubectl api-resources"
    set -f api_resource_selected (
      $k_cmd api-resources -oname  | \
      _fzf_wrapper  \
        --prompt="Api-resources> " \
        --ansi \
        --header-lines=1 \
        --preview="$k_cmd get {1}" \
        --preview-window="right:70:wrap" \
        $fzf_k8s_api_resources_opts
    )
    if test $status -eq 0
      #search resource, and prefix with api-resource
      set -l cursor_position $(commandline -C)
      _fzf_k8s_search_resource $api_resource_selected
      commandline -C $cursor_position
      commandline --insert -- "$api_resource_selected/"
      set length (string length (commandline))
      commandline -C $length
    end

    commandline --function repaint
end
