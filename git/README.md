# Git

Configuration for `git`.

Sets user name and email,
default editor and diff tool,
and a few other meaningful default values.


## Command aliases

| Command alias       | Description                                 | Executed command                         |
| ------------------- | ------------------------------------------- | ---------------------------------------- |
| `git st`            | status                                      | `git status`                             |
| `git a`             | add                                         | `git add`                                |
| `git ci`            | commit                                      | `git commit`                             |
| `git ca`            | add changed files and commit                | `git commit -a`                          |
| `git b`             | branch in verbose mode                      | `git branch -v`                          |
| `git co`            | checkout existing branch                    | `git checkout`                           |
| `git nb`            | create new branch and checkout              | `git checkout -b`                        |
| `git d`             | diff unstaged changes                       | `git diff`                               |
| `git l`             | show log in prettier format                 | `git log --pretty=...`                   |
| `git append`        | add stage changes to last commit            | `git commit --amend --no-edit`           |
| `git reword`        | edit commit message of last commit          | `git commit --amend`                     |
| `git changes`       | show which files changed for single commits | `git log log --pretty=... --name-status` |
| `git delete`        | add deleted files to index                  | `...`                                    |
| `git unstage`       | remove files from index                     | `git reset HEAD`                         |
| `git theirs`        | replace current branch by other             | `git reset --hard`                       |
| `git edit-conflict` | edit all conflicting files in $EDITOR       | `...`                                    |
| `git add-conflict`  | add all changes to conflicting files        | `...`                                    |
