# 代码推送
#!/bin/sh

#1、读取版本和描述
#2、用描述提交代码

echo "\n ------ 执行 git 本地提交代码操作 ------ \n"

podspec_summary=$(sh ~/Documents/GitHub/XcodeFast/readPodSpec.sh "s.summary")

echo "****** gitpush：描述 ${podspec_summary} ******"

# git 操作
echo "git add ."
git add .
echo "git status"
git status
echo "git commit -m ${podspec_summary}"
git commit -m ${podspec_summary}

git push