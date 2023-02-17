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



