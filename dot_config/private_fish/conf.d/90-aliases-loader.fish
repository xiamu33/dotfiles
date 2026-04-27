if not status is-interactive
    exit
end

set -l alias_dir "$HOME/.config/fish/aliases"
if test -d "$alias_dir"
    for f in "$alias_dir"/*.fish
        if test -f "$f"
            source "$f"
        end
    end
end
