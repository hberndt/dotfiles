# GNU utils path overrides as default CLI tools
export PATH="/opt/homebrew/bin:$PATH"
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
fi
export PATH=$HOME/bin:$PATH

# default to JDK
export PATH="/Library/Java/JavaVirtualMachines/temurin-25.jdk/Contents/Home:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 25`

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/kustomize/plugin/viaduct.ai/v1/ksops:$PATH"

export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
