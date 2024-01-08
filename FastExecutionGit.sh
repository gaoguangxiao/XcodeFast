# !/bin/sh

# git快捷指令 推送代码 


function runGitCommand()
{
    echo "enter runGitCommand function"
    echo $2
    case $2 in "git push【根据s.sumary描述推送代码】") #git push
    runGitPush $1 "$2"
    ;;
    "git tag【s.version构建tag】") # iTerm2
    runGitTag "$1" "$2"
    ;;
    "git push_tag_trunkpush【一键部署】") # iTerm2
    runGitPushTagTrunk "$1" "$2"
    ;;
    *) # 其它
    echo "指定了不支持的Git命令!"
    # showAlert $message "提示" "知道了" "1" "0" "占位" "stop"
    ;;
    esac
}

function runGitPush()
{
	# echo $1
	# cd $1
	sh ~/Documents/GitHub/XcodeFast/gitPush.sh
}

function runGitTag()
{
	sh ~/Documents/GitHub/XcodeFast/gitTag.sh
}

# 推送代码-打标签-推送远程
function runGitPushTagTrunk()
{
    echo "一键部署"

    sh ~/Documents/GitHub/XcodeFast/gitPush.sh

    sh ~/Documents/GitHub/XcodeFast/gitTag.sh

    solePodCommand "$1" "pod trunk push --allow-warnings"
    # sh ~/Documents/GitHub/XcodeFast/gitTag.sh
}

# 一条指令仅仅运行这个
function solePodCommand()
{
   echo '运行组件推送'
   
osascript <<EOF
    tell application "Terminal"
    if not (exists window 1) then reopen
    do script "cd \"$1/\"; $2" in window 1
    end tell
    activate
EOF
}

runGitCommand $1 $2