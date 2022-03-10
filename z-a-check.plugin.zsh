# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

autoload -Uz :za-check-handler

# An empty stub to fill the help handler fields
:za-check-null-handler() { :; }

# hook:preinit-<->

# hook:atinit-<->
# hook:!atinit-<->

# hook:before-load-<->

# hook:atload-<->
# hook:!atload-<->

# hook:atclone-<->
# hook:!atclone-<->

# hook:atpull-<->
# hook:!atpull-<->
# hook:%atpull-<-> - always ran regardless of update

# hook:atdelete-<->

# Register !atclone hook
@zinit-register-annex "z-a-check" \
    hook:\!atclone-0 \
    :za-check-handler \
    :za-check-null-handler \
    "check''" # register a new ice-mod: test''
