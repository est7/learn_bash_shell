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

