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






