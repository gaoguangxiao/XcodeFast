#检测指令
pod_liblint="pod lib lint --allow-warnings --verbose --no-clean"


# 检测指令和目录的合法性，如果指令为验证，则需要查询验证所需要执行的目录，返回返回合理的路径，默认返回$1
function checkPodCommand(){
    # //判断指令，如果是`pod_liblint`需要，返回查看本目录是否有podspec文件，没有返回上级查
    _path=$1
   echo "enter checkPodCommand function"
   echo $2


return "${_path}"



}

#获取目录
path=`pwd`

# checkPodCommand "$path" "$pod_liblint"
poExecute=checkPodCommand "$path" "$pod_liblint"

echo $poExecute