# 读取podspec文件描述和版本号


# 获取到的文件路径
file_path=""
file_name=""
# 文件后缀名
file_extension="podspec"
# 文件夹路径，pwd表示当前文件夹
directory="$(pwd)"

# 参数1: 路径；参数2: 文件后缀名
function getFileAtDirectory(){
    for element in `ls $1`
    do
    dir_or_file=$1"/"$element
    # echo "$dir_or_file"
    if [ -d $dir_or_file ]
    then
    getFileAtDirectory $dir_or_file
    else
    file_extension=${dir_or_file##*.}
    if [[ $file_extension == $2 ]]; then
    # echo "$dir_or_file 是 $2 文件"
    file_path=$dir_or_file
    file_name=$element
    fi
    fi
    done
}
getFileAtDirectory $directory $file_extension

# 定义pod文件名称
pod_file_name=${file_name}

# echo "读取文件路径"$pod_file_name

# 查找 podspec 的版本
# search_str="s.version"
search_str=$1

# echo "要获取的字符：${search_str}"

# 读取podspec的第一个参数
podspec_1=""

#定义了要读取文件的路径
my_file="${pod_file_name}"

while read my_line
do
#输出读到的每一行的结果
# echo $my_line
# 查找到包含的内容，正则表达式获取以 ${search_str} 开头的内容
result=$(echo ${my_line} | grep "^${search_str}")
if [[ "$result" != "" ]]
then
#echo "\n ${my_line} 包含 ${search_str}"
# 分割字符串，是变量名称，不是变量的值; 前面的空格表示分割的字符，后面的空格不可省略
array=(${result// / })
#echo "\n array: ${array}"
# 数组长度
count=${#array[@]}
#echo "\n count: ${count}"
# 获取最后一个元素内容
version=${array[count - 1]}
#echo "\n version: ${version}"
# 去掉 '
version=${version//\'/}

podspec_1=$version
#else
#echo "\n ${my_line} 不包含 ${search_str}"
fi

done < $my_file

echo "${podspec_1}"

# echo "\n ---- 读取podspec文件内容 end ---- \n"