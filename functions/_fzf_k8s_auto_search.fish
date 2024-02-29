function _fzf_k8s_auto_search --description "Search resource depending on content of commandline"
    # Get the last command from history
    set -l cmd (commandline --tokenize)
    # search api-resources if commandline is empty
    if test -z "$cmd"
      _fzf_k8s_search_api_resources
    end

    # search api-resources if resource does not exist
    # assummes kubectl <command> <resource>
    set result (kubectl get $cmd[3] 2>&1)
    if test $status -gt 0
        _fzf_k8s_search_api_resources
    else
       _fzf_k8s_search_resource $cmd[3]
    end
end

