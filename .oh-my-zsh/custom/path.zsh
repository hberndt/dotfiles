# GNU utils path overrides as default CLI tools
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi
export PATH=$HOME/bin:$PATH

# default to JDK 11
j17

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="~/.emacs.d/bin"
