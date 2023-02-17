#!/bin/bash

echo "hello world"

# 不要空格，
# variable = "Some variable"
variable="Some variable"

echo "$variable ,hello world"


#  会把 Variable 中首次出现的 "able" 替换成 “ABLE”。
echo ${variable/able/ABLE}

# 返回默认值

# Foo=1
echo ${Foo:-"default"}


# 读取输入

echo "whatsyourname"
read Name
echo "hello,$Name"


# 内置变量：
# 下面的内置变量很有用
echo "Last program return value: $?"
echo "Script's PID: $$"


# 执脚本的参数
echo "Number of arguments: $#"
echo "Scripts arguments: $@"
# >bash learnshell.sh -param1 -param2
echo "Scripts arguments separated in different variables: $1 $2..."

echo "$USER"

# if 
#
# $USER 预治的本机名
if [ $Name -ne $USER ]
then
    echo "Your name isn't your username"
else
    echo "Your name is your username"
fi

# todo 判断文件是否存在
if test -d learnshell.sh
then
  echo "该文件存在"
else
  echo "该文件不存在"
fi

# 在 if 语句中使用 && 和 || 需要多对方括号
Name="Steve"
Age=15

if [ $Name == "Steve" ] && [ $Age -eq 15 ]
then
    echo "This will run if $Name is Steve AND $Age is 15."
fi

if [ $Name == "Daniya" ] || [ $Name == "Zach" ]
then
    echo "This will run if $Name is Daniya OR Zach."
fi




# 根据上一个指令执行结果决定是否执行下一个指令
echo "Always executed" || echo "Only executed if first command fails"
echo "Always executed" && echo "Only executed if first command does NOT fail"



