function _fzf_k8s_search_resource --description "Search resource on the current kubernetes cluster"
    set -f k_cmd (command -v kubectl || "kubectl")
    set -f resource $argv 
    set -f resource_selected (
      $k_cmd get $resource | \
      _fzf_wrapper --multi \
        --prompt="$resource> " \
        --query (commandline --current-token) \
        --ansi \
        --header-lines=1 \
        $fzf_k8s_resource_opts
    )
    if test $status -eq 0
      set -f resource (string split -m1 " " -- $resource_selected)[1]
      commandline --current-token --replace -- $resource
    end

    commandline --function repaint
end
