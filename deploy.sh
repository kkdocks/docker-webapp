#!/bin/sh
readonly envDef=ENV_DEF
readonly workspacePath=/workspace
readonly htmlPath=/usr/share/nginx/html

strEnvReplace() {
  # 字符串环境变量替换
  envName=$1
  eval envValue="$"$1
  filename=$2
  echo "Replace $envName with $envValue in the $filename"
  sed -i "s#$envName#$envValue#g" $filename
}

envReplace() {
  # $1: filepath
  # $2: envName
  for path in $(ls $1); do
    filename="$1/$path"
    if [ -d $filename ]; then
      # 如果是文件夹，递归替换
      envReplace $filename $2
    elif [ -f $filename ]; then
      # 替换.js .html文件
      case $filename in
      *.html)
        strEnvReplace $2 $filename
        ;;
      *.js)
        strEnvReplace $2 $filename
        ;;
      *.css)
        strEnvReplace $2 $filename
        ;;
      *.json)
        strEnvReplace $2 $filename
        ;;
      esac
    fi
  done
}

_main() {
  echo '>>>>>>>>>>>>>>>>>>>>>>>>>>> Deploy Start <<<<<<<<<<<<<<<<<<<<<<<<<<<<'
  # 删除上次替换好的html
  echo "Clean $htmlPath"
  rm -rf $htmlPath
  # 复制原始html到public目录
  echo "Copy $workspacePath to $htmlPath"
  cp -rf $workspacePath $htmlPath
  # 读取需要替换的环境变量列表，循环替换环境变量
  eval envList="$"$envDef
  if [ -z "$envList" ]; then
    echo "ENV_DEF not exists or is empty, Ignore!"
  else
    echo "ENV_DEF List: $envList"
    for envName in $envList ; do
        if [ ! -z "$envName" ]; then
            envReplace $htmlPath $envName
        fi
    done
  fi
  echo '>>>>>>>>>>>>>>>>>>>>>>>>>>> Deploy End <<<<<<<<<<<<<<<<<<<<<<<<<<<<'
}

# Start
_main "$@"