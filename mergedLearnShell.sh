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



# #!/bin/bash


# 表达式格式
# 要两个括号，一个不行
echo $((10+5))

ls -l | grep "\.sh"


# 重定向输入和输出（标准输入，标准输出，标准错误）。
# 以 ^EOF$ 作为结束标记从标准输入读取数据并覆盖 hello.py :

cat > hello.py << EOF
#!/usr/bin/env python
from __future__ import print_function
import sys
print("#stdout", file=sys.stdout)
print("#stderr", file=sys.stderr)
for line in sys.stdin:
    print(line, file=sys.stdout)
EOF


# 重定向可以到输出，输入和错误输出。
# ">" 符号是重定向符号，用于将命令的输出重定向到指定的文件中。
# ">" 符号是将标准输出重定向到指定文件的重定向符号，
# "2>" 符号是将标准错误输出重定向到指定文件的重定向符号，
# "2>&1" 是将标准错误输出重定向到标准输出的符号组合。
# 在这个命令中，">" 符号后面的 "output.out" 表示输出文件的名称和路径。

# hello.py 文件在命令行中运行，并将输出结果保存到名为 "output.out" 的文件中。
python3 hello.py > "output.out"

# 如果指定的文件已经存在，">" 符号会将其覆盖；如果要将输出追加到文件中而不是覆盖文件，请使用 ">>" 符号。
python3 hello.py >> "output.out"

# > 会覆盖已存在的文件， >> 会以累加的方式输出文件中。
python3 hello.py >> "output.out" 2>> "error.err"

# 将错误输出到error.err
# 您在命令行中运行这个命令时，Python 3 将执行 hello.py 文件，并将标准输出打印到命令行窗口中，同时将标准错误输出写入 "error.err" 文件中。 
# "2>" 符号是将标准错误输出重定向到指定文件的重定向符号。在这个命令中，"2>" 表示将标准错误输出重定向，而 "error.err" 表示输出错误的文件名和路径。
python3 hello.py 2> "error.err"

#例如，python3 hello.py 1> "output.out" 2> "error.err" 将标准输出重定向到 "output.out" 文件中，将标准错误输出重定向到 "error.err" 文件中。

# 将 hello.py 文件在 Python 3 中运行，并将标准输出和标准错误输出都重定向到名为 "output-and-error.log" 的文件中。
# "2>&1" 是将标准错误输出重定向到标准输出的符号组合。
python3 hello.py > "output-and-error.log" 2>&1

# 在这个命令中，">" 后面的 "/dev/null" 表示 Linux 系统中的 "null" 设备，它是一个特殊的设备文件，可以将所有写入它的数据都丢弃，不会存储到任何实际的文件中。
# 当您在命令行中运行这个命令时，Python 3 将执行 hello.py 文件，并将标准输出和标准错误输出都丢弃，不会输出到命令行窗口或任何文件中。
# 这种方法常用于在不需要输出的情况下运行程序，或者用于调试时临时禁用输出。
python3 hello.py > /dev/null 2>&1


# 清理临时文件并显示详情（增加 '-i' 选项启用交互模式）
rm -v -i output.out error.err output-and-error.log

# 运行指令并打印文件描述符 （比如 /dev/fd/123）
# 具体可查看： man fd
# echo <(echo "#helloworld") 是一个使用进程替换的命令，它将一个命令的输出作为一个文件名参数传递给另一个命令。

# 在这个命令中，<(echo "#helloworld") 是一个进程替换，它会将 echo "#helloworld" 命令的输出作为一个文件描述符传递给 echo 命令。
# 文件描述符表示了一个文件或其他输出源，可以被程序读取或写入。
# 因此，echo <(echo "#helloworld") 命令实际上将 echo "#helloworld" 的输出作为一个文件名参数传递给 echo 命令。
# 在这个例子中，echo "#helloworld" 的输出被传递给一个临时文件，并将该文件的路径传递给 echo 命令。
# 因此，echo 命令将输出文件路径，而不是 "#helloworld"。
echo <(echo "#helloworld")

# 覆盖 output.out , 追加 error.err 并统计行数

# 将一个关于Bash shell基本功能和重定向的信息文本写入到名为output.out的文件中，同时将错误输出追加到名为error.err的文件中。
info bash 'Basic Shell Features' 'Redirections' > output.out 2>> error.err

# wc是一个Linux/Unix命令，用于计算文件中的行数、字数和字节数。wc命令的名称是"word count"的缩写，但它实际上可以计算更多的内容。

# wc命令有许多选项，其中最常用的选项是-l，它可以用来计算文件中的行数。例如，执行wc -l filename命令可以计算一个文件中的行数。
# 其他常用选项包括-w用于计算文件中的字数，-c用于计算文件中的字节数。
# 接着，wc -l output.out error.err命令会对output.out和error.err文件进行行计数，并将结果输出到终端中。-l选项指示wc命令仅计算行数。 
wc -l output.out error.err

# 这个命令会向终端输出字符串 "#helloworld"，然后将字符串写入一个名为 "output.out" 的文件中。
# 同时，使用重定向符号 ">/dev/null" 将标准输出流重定向到空设备文件 "/dev/null"，从而抑制任何输出到终端。
# 这意味着不会看到任何在终端上的输出，但是文件 "output.out" 将会包含 "#helloworld" 字符串。
# tee 是一个 Linux/Unix 命令，用于从标准输入中读取数据，并将其复制到标准输出（通常是终端屏幕）和一个或多个文件中。
echo "#helloworld" | tee output.out >/dev/null


# 以 "#helloworld" 覆盖 output.out:

cat > output.out <(echo "#helloworld")
echo "#helloworld" > output.out

# 这个 | 符号是一个 Linux/Unix 系统中的管道符号，用于将一个命令的输出作为另一个命令的输入。在上面的命令中，echo 命令用于输出文本字符串 #helloworld，| 符号将 echo 命令的输出重定向到 cat 命令。cat 命令会从标准输入中读取数据，因此，它会从管道中读取 echo 命令输出的字符串，并将其写入名为 output.out 的文件中。
# 因此，这个命令的作用是将字符串 #helloworld 写入到名为 output.out 的文件中。echo 命令用于输出字符串，cat 命令用于从标准输入中读取数据并将其写入文件。管道符号 | 将这两个命令连接起来，使得 echo 命令的输出被重定向到 cat 命令的标准输入中，从而实现了将字符串写入文件的功能。
echo "#helloworld" | cat > output.out


# 清理临时文件并显示详情（增加 '-i' 选项启用交互模式）
rm -v output.out error.err output-and-error.log

# 一个指令可用 $( ) 嵌套在另一个指令内部：
# 以下的指令会打印当前目录下的目录和文件总数
echo "There are $(ls | wc -l) items here."


# 反引号 `` 起相同作用，但不允许嵌套
# 优先使用 $(  ).
echo "There are `ls | wc -l` items here."

read Name

case "$Name" in
  "nick") echo "There is nick";;
  "peter") echo "There is peter";;
  *) echo "noone here";;
esac


# 循环遍历给定的参数序列:
# 变量$Variable 的值会被打印 3 次。

for Variable in {1..5}
do
  echo "$Variable"
done


# 或传统的 “for循环” ：
for ((a=1; a<5; a++))
do
  echo "$a"
done

# 也可以用于文件
# 用 cat 输出 file1 和 file2 内容
for Variable1 in ./learnshell.sh ./learnshell01.sh ./learnshell02.sh
do
  cat "$Variable1"
done


# 或作用于其他命令的输出
# 对 ls 输出的文件执行 cat 指令。
for Output in $(ls)
do
    cat "$Output"
done


while [[ true ]]; do
  echo "loop boby here..."
  break 
done






# 你也可以使用函数
# 定义函数：
function foo ()
{
    echo "Arguments work just like script arguments: $@"
    echo "And: $1 $2..."
    echo "This is a function"
    return 0
}

# 更简单的方法
bar ()
{
    echo "Another way to declare functions!"
    return 0
}

# 调用函数
Name="nick"
foo "My name is " $Name


# 有很多有用的指令需要学习:
# 打印 file.txt 的最后 10 行
# tail 是一个常用的命令行工具，用于查看文件的末尾内容。以下是一些常用的 tail 命令选项：

# tail filename：查看文件的末尾 10 行内容。
# tail -n N filename：查看文件的末尾 N 行内容，其中 N 是一个数字。
# tail -f filename：实时查看文件的末尾内容，并在文件更新时自动刷新。
# tail -F filename：与 -f 类似，但在文件被删除、重新创建或重命名时，会自动重新打开文件。
# tail -c N filename：查看文件的末尾 N 个字节的内容，其中 N 是一个数字。可以使用 +N 来指定从文件的第 N 个字节开始输出。
# 需要注意的是，tail 命令默认以行为单位进行操作，但也可以使用 -c 选项以字节为单位进行操作。此外，tail 命令还支持使用通配I符来处理多个文件，例如 tail *.log 可以查看当前目录下所有以 .log 结尾的文件的末尾内容。
tail -n 10 file.txt


# 打印 file.txt 的前 10 行
head -n 10 file.txt

# 将 file.txt 按行排序
# sort file.txt 是一个命令，用于将指定文件 file.txt 中的文本按行进行排序。该命令会按照字典序（默认情况下）或者数字大小对每一行进行排序，并将排序结果输出到标准输出中（也可以使用 sort file.txt > sorted_file.txt 将排序结果保存到文件中）。

# 如果需要对文件进行反向排序，可以使用 sort -r file.txt 命令。另外，sort 命令还支持许多选项和参数，可以控制排序的方式，例如：

# -n：按照数字大小进行排序；
# -r：反向排序；
# -u：去重，只保留每个不同的行；
# -o <outfile>：将排序结果保存到指定文件 <outfile> 中，而不是输出到标准输出；
# -k <start>,<end>：按照指定区间 <start> 到 <end> 的字符进行排序。
# 要了解更多关于 sort 命令的使用方法和选项，请查阅命令的文档或者输入 man sort 命令查看帮助文档。
sort file.txt

# 报告或忽略重复的行，用选项 -d 打印重复的行
# 用于在指定文件 file.txt 中查找并输出重复的行。
# 该命令会按照字典序比较相邻的行，并输出重复的行（即某行与它前一行相同）。
 uniq -d file.txt
# 这个命令中的 -d 选项表示只输出重复的行，而不是所有的行。如果想要输出所有的不重复的行，可以使用 uniq file.txt 命令。
# 注意，uniq 命令只能识别相邻的重复行，因此需要先使用 sort 命令将文件进行排序，然后再使用 uniq 命令，才能得到正确的结果。例如：
sort file.txt | uniq -d
# 这将会对文件 file.txt 进行排序，并输出其中的重复行。如果想要将重复行保存到文件中，可以使用重定向符号 >，例如：
sort file.txt | uniq -d > duplicates.txt




# 打印每行中 ',' 之前内容
cut -d ',' -f 1 file.txt
# cut 命令用于从文本文件中剪切出指定字段。
# cut -d ',' -f 1 file.txt 这个命令表示从文件 file.txt 中每一行的逗号分隔字段中，提取出第一个字段。具体解释如下：

# -d ',' 表示将逗号作为字段的分隔符；
# -f 1 表示提取第一个字段。
# 因此，cut -d ',' -f 1 file.txt 命令将会输出文件 file.txt 中每一行的第一个逗号分隔字段。
# 如果需要提取多个字段，可以将 -f 选项的参数指定为一个逗号分隔的字段列表，例如：
cut -d ',' -f 1,3 file.txt

# 这将会提取文件 file.txt 中每一行的第一个和第三个逗号分隔字段。

# 注意，cut 命令只能用于单个字符分隔的文本文件，如果需要处理复杂的文本格式，可能需要使用其他工具，如 awk 或 sed。
cut -d ',' -f 1 file.txt

# 将 file.txt 文件所有 'okay' 替换为 'great', （兼容正则表达式）
sed -i 's/okay/great/g' file.txt

# 将 file.txt 中匹配正则的行打印到标准输出
# 这里打印以 "foo" 开头, "bar" 结尾的行
grep "^foo.*bar$" file.txt

# 使用选项 "-c" 统计行数
grep -c "^foo.*bar$" file.txt

# 如果只是要按字面形式搜索字符串而不是按正则表达式，使用 fgrep (或 grep -F)
fgrep "^foo.*bar$" file.txt 



#!/bin/bash

# 在 Bash 中，可以使用条件语句来判断文件是否存在。其中，常用的条件语句有 if 和 test，它们的语法如下：

# 使用 if 语句：
#if [ -e /path/to/file ]; then
#  echo "File exists"
#else
#  echo "File does not exist"
#fi
#使用 test 命令：
#
#if test -e /path/to/file; then
#    echo "File exists"
#else
#    echo "File does not exist"

#下面这样写不对。
# Bash 中的 if 语句用于执行条件判断，而 [[ ... ]] 是 Bash 中用于扩展条件的关键字，
# test 命令用于测试文件的属性，-e 是用于测试文件是否存在的一个选项。
# 因此，可以把它们组合起来写出条件语句来判断文件是否存在，例如：
# if [[ test -e file.txt]]; then
#  echo "message"
# fi
if [[ -e mergedLearnShell.sh ]]; then
  echo "File exists"
else
  touch mergedLearnShell.sh
fi


# cat 是一个 Linux/Unix 命令，用于查看文件内容、将多个文件合并为一个文件，或从标准输入读取数据并将其写入标准输出。
# 如果不指定任何文件名，则 cat 命令将从标准输入读取数据，并将其写入标准输出。例如，可以使用以下命令从标准输入读取数据并将其显示在终端上：
# >cat 
# 这将启动 cat 命令的交互模式，等待用户输入数据。用户可以输入一些文本，然后按 Ctrl-D 来结束输入并将数据写入标准输出。

# tee 和 cat 命令都是 Linux/Unix 系统中的常用命令，但它们的用途有所不同。

# cat 命令的主要功能是将文件的内容输出到标准输出（通常是终端屏幕）。它可以用于查看文件的内容，或将多个文件合并为一个文件。当从标准输入中读取数据时，它会将这些数据写入标准输出。cat 命令通常用于将文件的内容输出到终端屏幕或将文件合并为一个文件。

# tee 命令的主要功能是从标准输入中读取数据，并将其复制到标准输出（通常是终端屏幕）和一个或多个文件中。tee 命令通常用于将标准输入的数据同时写入一个或多个文件，并在屏幕上显示数据。这种功能通常用于将输出同时写入日志文件和屏幕上进行实时监控。

# 因此，虽然 cat 和 tee 命令在某种程度上都可以从标准输入中读取数据并将其写入文件中，但它们的主要功能是不同的。cat 命令用于查看文件的内容或将多个文件合并为一个文件，而 tee 命令则用于将标准输入的数据复制到文件中，并在终端屏幕上显示数据。

# 如果指定一个或多个文件名作为参数，则 cat 命令将按照给定的顺序依次显示这些文件的内容。例如，以下命令将显示一个名为 file.txt 的文件的内容：
# cat file.txt


# 如果想要将多个文件的内容合并为一个文件，可以将多个文件名作为参数传递给 cat 命令，
# 并使用重定向符号 > 将输出写入一个新的文件。
# 例如，以下命令将合并名为 file1.txt、file2.txt 和 file3.txt 的三个文件，并将结果写入名为 merged.txt 的新文件：

cat ./learnshell.sh ./learnshell01.sh ./learnshell02.sh ./learnshell03.sh ./learnshell04.sh > mergedLearnShell.sh
