## z-a-check

Very simple annex to check whether the program is installed before
the `atclone` hook is ran.

This would allow for a loop of the following to be used:
```zsh
zinit depth'3' lucid wait'0a' check'%PLUGIN%' for \
```
It would check every program before it is installed.

### [`zinit`](https://github.com/lmburns/zinit) fork
With my fork of `zinit` this negated `has` ice is available; however, `@zinit-substitute`
is not able to be ran to expand `%PLUGIN%` into the correct plugin name.

```zsh
# checks whether you don't have the program 'loop'
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

<!-- vim:set ft=markdown tw=80 -->
