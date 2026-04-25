set -l __brew_bin
if type -q brew
    set __brew_bin (command -s brew)
else if test -x /opt/homebrew/bin/brew
    set __brew_bin /opt/homebrew/bin/brew
else if test -x /usr/local/bin/brew
    set __brew_bin /usr/local/bin/brew
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    set __brew_bin /home/linuxbrew/.linuxbrew/bin/brew
end

if test -n "$__brew_bin"
    eval ($__brew_bin shellenv)

    set -l __brew_comp "$(brew --prefix)/share/fish/vendor_completions.d"
    if test -d $__brew_comp; and not contains -- $__brew_comp $fish_complete_path
        set -g fish_complete_path $__brew_comp $fish_complete_path
    end
end
