## z-a-check

Very simple annex to check whether the program is installed before
the `atclone` hook is ran.

This would allow for a loop of the following to be used:
```zsh
zinit depth'3' lucid wait'0a' check'%PLUGIN%' for \
```
It would check every item in the single-quotes before it is installed.

### Usage

#### If the program is already installed
```zsh
# You are checking that an already installed program is there     -> true
zinit lucid wait'0a' check'%PLUGIN%' for \
# You are checking that an already installed program is not there -> false
zinit lucid wait'0a' check'!%PLUGIN%' for \
```

#### If the program is not installed
```zsh
# You are checking that a not installed program is there          -> false
zinit lucid wait'0a' check'%PLUGIN%' for \
# This is the variation that the program was designed for
# You are checking that a not installed program is not there      -> true
zinit lucid wait'0a' check'!%PLUGIN%' for \
```

## My [`zinit`](https://github.com/lmburns/zinit) fork
With my fork of `zinit` the negated `has` ice is available; however, `@zinit-substitute`
is not able to be ran to expand `%PLUGIN%` into the correct plugin name. That is the reason why
this annex was created.

```zsh
# checks whether you don't have the program 'loop' for it to be true
zinit depth'3' lucid wait'0a' has'!loop' for \
# can be achieved with this as well
zinit depth'3' lucid wait'0a' wait'[[ ! -v commands[loop] ]]' for \
```
* The only difference between the above two is that the first one
  will discard the line and not keep it held in the `@zinit-scheduler`. The
  `wait` ice keeps the test in a continuous loop, which allows for the value to
  change to true during an interactive shell. The `has'!loop'` will only be
  ran once on the sourcing of the `.zshrc`.
* This is useful if you would like to not install more than one of the same
  program.
* As a note, I am unsure if keeping many items in the
  `@zinit-scheduler` would slow anything down. I would prefer to not have the
  equivalent of a [`fswatch`](https://github.com/emcrisostomo/fswatch) command
  being ran for every plugin I used.


### Notes
* The `syntax` folder contains two `zsh.vim` files
  * The first one is the best `zsh` syntax file I have found.
    It is better than the current one that comes with neovim.
  * The file in the `after` folder was initially created by `psprint`,
    and contains `zinit` syntax highlighting with all of the annexes as well.
    It also has `zsh` keywords that are not found within the regular `zsh`
    syntax file (e.g., `coproc`, `zf_rm`, etc)
* This program works by checking the `$commands[@]` array for the plugin. If the
  program exits, an error message is displayed and the **folder is deleted**.

<!-- vim: set ft=markdown tw=80 et:sw=2 ts=4 sts=-1 -->
