# GNU utils path overrides as default CLI tools
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi
export PATH=$HOME/bin:$PATH

# default to JDK
export PATH="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 21`

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
