# !/bin/sh

# git快捷指令 推送代码 


function runGitCommand()
{
    echo "enter runGitCommand function"
    echo $2
    case $2 in "git push【根据s.sumary描述推送代码】") #git push
    runGitPush $1
    ;;
    "2") # iTerm2
    echo "选择了 iTerm2 终端执行"
    # runInITerm "$1" "$2"
    ;;
    *) # 其它
    message="指定了不支持的终端类型!"
    # showAlert $message "提示" "知道了" "1" "0" "占位" "stop"
    ;;
    esac
}

function runGitPush()
{
	# echo $1
	# cd $1
	sh /Users/gaoguangxiao/Documents/GitHub/XcodeFast/gitPush.sh
}

function runGitTag()
{
	sh gitTag.sh
}


runGitCommand $1 $2