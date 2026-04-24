if not set -q __safe_alias_names
    set -g __safe_alias_names
end
if not set -q __safe_alias_defs
    set -g __safe_alias_defs
end

# 列出别名
function aliass
    for i in (seq (count $__safe_alias_names))
        echo "alias $__safe_alias_names[$i] => $__safe_alias_defs[$i]"
    end
end

# 用法：
#   safe_alias <name> <command...>
#   safe_alias --no-wraps <name> <command...>
# 例子：
#   safe_alias ca cargo
#   safe_alias l ls -al
#   safe_alias ls command eza
#   safe_alias --no-wraps czia chezmoi edit --apply
function safe_alias
    set -l do_wraps 1
    set -l args $argv

    if test (count $args) -gt 0; and test "$args[1]" = --no-wraps

        set do_wraps 0
        set args $args[2..-1]
    end

    set -l new_name $args[1]
    set -l raw $args[2..-1]

    if test -z "$new_name" -o (count $raw) -eq 0
        echo "Usage: safe_alias [--no-wraps] <alias> <command...>"
        echo "   e.g. safe_alias gp \"git push\""
        echo "        safe_alias ls command eza"
        return 1
    end

    # 兼容 safe_alias gp "git push"（单字符串） 和 safe_alias gp git push（多参数）
    set -l prefix $raw
    if test (count $raw) -eq 1
        set prefix (string split ' ' -- $raw[1])
    end

    set -l force_command 0
    if test "$prefix[1]" = command
        set force_command 1
        set prefix $prefix[2..-1]
    end

    if test (count $prefix) -eq 0
        echo "safe_alias: missing command after 'command'"
        return 1
    end

    set -l real_cmd $prefix[1]
    if not type -q $real_cmd
        # echo "safe_alias: command not found '$real_cmd'"
        return 1
    end

    # 定义别名
    if test $force_command -eq 1 -o "$new_name" = "$real_cmd"
        function $new_name --description "alias for $prefix" --inherit-variable prefix
            command $prefix $argv
        end
        if test $do_wraps -eq 1
            complete -c $new_name --wraps $real_cmd
        end
    else
        function $new_name --description "alias for $prefix" --inherit-variable prefix
            $prefix $argv
        end
        if test $do_wraps -eq 1
            complete -c $new_name --wraps $real_cmd
        end
    end

    # 记录别名
    set -l def (string join ' ' -- $raw)
    set -l idx (contains -i $new_name $__safe_alias_names)
    if test -n "$idx"
        set __safe_alias_defs[$idx] $def
    else
        set -ga __safe_alias_names $new_name
        set -ga __safe_alias_defs "$def"
    end
end
