[Linux 命令大全](https://www.runoob.com/linux/linux-command-manual.html)

[Linux 文件基本属性](https://www.runoob.com/linux/linux-file-attr-permission.html)
1. chown
2. chmod
3. rwx


[文件与目录管理](https://www.runoob.com/linux/linux-file-content-manage.html)
1. cat
2. cp
3. mv
4. mkdir


[Shell 函数](https://www.runoob.com/linux/linux-shell-func.html)

[Shell test 命令]
1. -eq
2. =
3. -e


[Shell 输入/输出重定向](https://www.runoob.com/linux/linux-shell-io-redirections.html)

1. command > file	将输出重定向到 file。
2. command < file	将输入重定向到 file。
3. command >> file	将输出以追加的方式重定向到 file。
4. n > file	将文件描述符为 n 的文件重定向到 file。
5. n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
6. n >& m	将输出文件 m 和 n 合并。
7. n <& m	将输入文件 m 和 n 合并。
8. << tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入。


command1 > file1
命令执行command1然后将输出的内容存入file1。
注意任何file1内的已经存在的内容将被新内容替代。如果要将新内容添加在文件末尾，请使用>>操作符。

在 Bash 中，"<" 和 ">" 这两个符号分别表示输入重定向和输出重定向。

"<" 表示输入重定向，可以从文件或命令的输出中获取输入。例如，可以使用命令 cat < file.txt 将 file.txt 文件的内容作为 cat 命令的输入。
">" 表示输出重定向，可以将命令的输出写入文件。例如，可以使用命令 ls > file.txt 将 ls 命令的输出写入到 file.txt 文件中。
除了这两个符号外，还有一些相关的符号，例如 ">>" 表示追加输出到文件，"<>" 表示以读写方式打开文件等等。

需要注意的是，在 Bash 中输入输出重定向符号前后都不能有空格，否则 Bash 会将它们视为命令参数的一部分。




[Shell 文件包含外部脚本]
使用 . 号来引用test1.sh 文件
. ./test1.sh
