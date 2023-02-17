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
