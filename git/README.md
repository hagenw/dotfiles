# Git

## Command aliases

| Command alias | Executed command | Description |
| --- | --- | --- |
| `git st`            | git status | status |
| `git a`             | git add | add |
| `git b`             | git branch -v | branch in verbose mode |
| `git append`        | git commit --amend --no-edit | add stage changes to last commit |
| `git reword`        | commit --amend | edit commit message of last commit |
| `git co`            | git checkout | checkout existing branch |
| `git nb`            | git checkout -b | create new branch and checkout |
| `git d`             | git diff | diff unstaged changes |
| `git l`             | git log --pretty=... | show log in prettier format |
| `git changes`       | git log log --pretty=... --name-status | show which files changed for single commits |
| `git unstage`       | git reset HEAD | remove files from index |
| `git theirs`        | git reset --hard | replace current branch by other, e.g. `git theirs origin/main` |
| `git edit-conflict` | ... | edit all conflicting files in $EDITOR |
| `git add-conflict`  | ... | add all changes to conflicting files |

