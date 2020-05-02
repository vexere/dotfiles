# Introduction to git alias
`git` is super powerful tool for source code versioning management, it supports many commands from simple to advance and has special support for its own commands - let's call it integrated alias.

The scope of this work would include both standard bash alias and integrated alias.

For integrated alias, luckily thanks to Joel Parker Henderson @ https://github.com/joelparkerhenderson and others, there was already a very good version of git command alias. To make it clear, alias is not just a way to shorten commands. In many scenarios, alias is about renaming to a more memorable form, or more important alias points out popular commands' options or popular commands that you should be aware of.

For instance some people know about `git stash` command, but `stash` would not be the best name for its purpose. Why not just `save` and `pop`?

Or what would you do if you gonna make a lot of changes to current branch, but do not want to commmit it as the state is incomplete? These guys helped us to define `snapshot` alias that would literally take a snapshot at current state while still keeping the uncommitted code (basically it is `git stash` and then `git stash pop`)

Many other beautiful things are waiting for your discovery here https://github.com/GitAlias/gitalias and `git-integrated-alias-base` file's content. 

# Standard bash alias for git
We also provide some other aliases to help you to work with git even easier.

For more detail please take a look at `gitalias-base` and `gitalias` file.

`git` alias prefix is `g`. You are also welcome to use another `git` prefix easily by changing `$GIT_ALIAS_PREFIX` variable in `gitalias` file.

You are also welcome to override git aliases by modifying `gitalias` file to unset aliases or adding another aliases.

We also welcome any improvement to git alias and git best practices. If you have any cool idea please don't hesitate to make a merge request or create a github issue so we can have further discussion.

Supported alias are as below table

 Alias | Explanation |
| -- | -- |
| `g` | `git`. You can try any git command by using `g`, for example `g s` is equivalent to `git status`, or see `gss` / `gs` aliases below for alternative. All git command aliases can be found within `git-integrated-alias-base` |
| `glg` | `git log` |
| `gl1` | `git log --oneline` with essential information about author and relative committer date |
| `gl` | git log using `tig` - An interactive TUI tool for working with git. Please visit tig official's site for more information https://jonas.github.io/tig/ |
| `gs` | git status using `tig`. Similar to open `tig` and then press `s` key |
| `gss` | git status - show changes not staged |
| `gbl` | show git branches sort by committerdate in descending order |
| `gcl` | `git clone` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` : create new branch |
| `gf` | `git fetch` : fetch remote content. Not merge with local branch. |
| `gfa` | `git fetch --all` : fetch all remote branches. Not merge with local branch. |
| `gpp` | `git pull --rebase=preserve` : recommend way to do git pull. This fetches and then merge local branch flatten but still preseving merge commits in local branch. See `git-integrated-alias-base` for more information. |
| `gpl` | `git pull` : not recommend as it would cause local branch to have annoying or unintentional merge commits |
| `gd` | `git diff`. You may want to try `gs` or `tig status` for alternative. |
| `gdg` | `git-cola` : git diff using GUI. `git-cola` could be installed using `brew install git-cola`. You may want to try `gs` or `tig status` for alternative. As `tig` supports very well for staging file by file / line by line. |
| `gcm` | `git commmit -m` |
| `gca` | `git commit --amend` : fix previous commit by appending current local changes into last commit |
| `gcam` | `git commit --amend --message` : fix previous commit by appending current local changes into last commit and edit last commit message |
| `ga` | `git add .` : add all files in current directory, similar to `git add --all` |
| `gacp` | `git add . && git commit -m ... && git push ...` : add, commit and push to remote branch |
| `gps` | `git push origin HEAD` : push local branch to same branch name of remote `origin` |

# Working with `tig`
Popular `tig` hotkeys

Hotkey | Explanation |
| -- | -- |
| `h` | show help menu including hotkeys information |
| `q` | quit |
| `up`/`down` | navigation in main window. Similar to capitalized `J`/`K` |
| `enter` | show diff / detail window |
| `j`/`k` | up/down navigation in diff / detail window |
| `tab` | switch between windows |
| `enter` while in diff / detail window | down navigation, similar to `j` |
| `u` | stage selected file / press `u` on staged file to unstage |
| `1` | stage selected line / press `1` on staged line to unstage line |

You are free to add more hotkeys by editing dotfiles/git/tigrc file.

# Team management with git and fun facts
Try following to see interesting metrics on your git repo.

Command | Explanation |
| -- | -- |
| `g summary` | First & last commit date, top contributors, number of commits, most active dates, most active files... |
| `g churn` | sort files by commit count in decending order |
| `g log-of-email-and-count` | Show number of commits, percentages per email |

And many more, take a look at `git-integrated-alias-base` LOG ALIASES section.

# TODO: add more gif images to show actual usage

# Author
Author: <Long Luong> longbkit@gmail.com
Co-founder & CTO @ VeXeRe - the largest intercity bus ticket booking platform in Vietnam, also largest SaaS for bus operators.