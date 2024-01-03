# 打开窗口 运行指令并关闭
function runInTerminal()
{
    echo $'World!'
sleep 5
osascript -e 'tell application "Terminal" to close (every window whose name contains "'"$THIS_FILE"'")' & exit
}

runInTerminal