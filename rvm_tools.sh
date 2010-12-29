function __git_dirty {
  git diff --quiet HEAD &>/dev/null 
  [ $? == 1 ] && echo "!"
}

function __git_branch {
  __git_ps1 " %s"
}

function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" == "1.8.7" ] && version=""
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}
