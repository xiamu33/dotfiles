if not status is-interactive
    exit
end

# Basic git abbreviations
abbr -a g git
abbr -a ga "git add"
abbr -a gaa "git add --all"
abbr -a gau "git add --update"

abbr -a gb "git branch"
abbr -a gbr "git branch -r"
abbr -a gba "git branch -a"
abbr -a gbd "git branch -d"
abbr -a gbD "git branch -d -f"

abbr -a gc "git commit"
abbr -a gcm "git commit -m"
abbr -a gacm "git commit -am"
abbr -a gca "git commit --amend"
abbr -a gcaa "git commit --amend -a"

abbr -a gco "git checkout"
abbr -a gcb "git checkout -b"
abbr -a gcor "git checkout --recurse-submodules"

abbr -a gs "git status"
abbr -a gss "git status -s"
abbr -a gsb "git status -sb"

abbr -a gd "git diff"
abbr -a gdca "git diff --cached"
abbr -a gdcw "git diff --cached --word-diff"
abbr -a gds "git diff --staged"

abbr -a glg "git lg"

abbr -a gl "git pull"
abbr -a gpr "git pull -r"
abbr -a gpra "git pull -r --autostash"
abbr -a gprav "git pull -r --autostash -v"

abbr -a gp "git push"
abbr -a gpd "git push --dry-run"

abbr -a gm "git merge"
abbr -a gma "git merge --abort"
abbr -a gmc "git merge --continue"

abbr -a grb "git rebase"
abbr -a grba "git rebase --abort"
abbr -a grbc "git rebase --continue"

abbr -a gcp "git cherry-pick"
abbr -a gcpa "git cherry-pick --abort"
abbr -a gcpc "git cherry-pick --continue"

abbr -a grh "git reset"
abbr -a grhh "git reset --hard"
abbr -a gru "git reset --"
abbr -a gclean! "git reset --hard; and git clean -df"

abbr -a gsu "git submodule update"
abbr -a gsur "git submodule update --recursive"
abbr -a gsuri "git submodule update --recursive --init"

abbr -a glf "git lfs"
abbr -a glfi "git lfs install"
abbr -a glfls "git lfs ls-files"
abbr -a glfs "git lfs status"
abbr -a glfup "git lfs pull; git lfs checkout"
abbr -a glfpr "git lfs prune"
