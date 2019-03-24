# vim-airline-themes

使用vombat主题


# lightline

待试用



# color scheme

vim-colors-solarized、molokai、gruvbox

目前使用molokai



# LeaderF

Once LeaderF is launched:

| Command                 | Description                                                              |
| ----------------------- | ------------------------------------------------------------             |
| `<C-C>` `<ESC>`         | quit from LeaderF                                                        |
| `<C-R>`                 | switch between fuzzy search mode and regex mode                          |
| `<C-F>`                 | switch between full path search mode and name only search mode           |
| `<Tab>`                 | switch to normal mode                                                    |
| `<C-V>` `<S-Insert>`    | paste from clipboard                                                     |
| `<C-U>`                 | clear the prompt                                                         |
| `<C-J>`                 | move the cursor downward in the result window                            |
| `<C-K>`                 | move the cursor upward in the result window                              |
| `<Up>`/`<Down>`         | recall last/next input pattern from history                              |
| `<2-LeftMouse>` `<CR>`  | open the file under cursor or selected(when multiple files are selected) |
| `<C-X>`                 | open in horizontal split window                                          |
| `<C-]>`                 | open in vertical split window                                            |
| `<C-T>`                 | open in new tabpage                                                      |
| `<F5>`                  | refresh the cache                                                        |
| `<C-LeftMouse>` `<C-S>` | select multiple files                                                    |
| `<S-LeftMouse>`         | select consecutive multiple files                                        |
| `<C-A>`                 | select all files                                                         |
| `<C-L>`                 | clear all selections                                                     |
| `<BS>`                  | delete the preceding character in the prompt                             |
| `<Del>`                 | delete the current character in the prompt                               |
| `<Home>`                | move the cursor to the begin of the prompt                               |
| `<End>`                 | move the cursor to the end of the prompt                                 |
| `<Left>`                | move the cursor one character to the left in the prompt                  |
| `<Right>`               | move the cursor one character to the right in the prompt                 |
| `<C-P>`                 | preview the result                                                       |

在任何目录下，按<leader>f，输入希望查找的文件，回车。

Ctrl+P，打开输入窗口。



# Supertab





# vim-plug

- 安装方便，直接把 vim-plug.vim 丢 .vim/autoload 下就好了

- 支持全异步插件安装、升级

- 延迟加载，提高 vim 启动速度

  

```
call plug#begin('~/.vim/plugged') "开始，指定插件安装目录
Plug 'junegunn/vim-easy-align'  
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  "触发时才加载
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }        "打开对应文件才加载
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }  "选择插件分支
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }  "安装插件时执行命令
"....
call plug#end()  "结束
```



# vim-surround

方便快捷的删除、修改、添加surroundings in pairs，比如各种括号、各种引号、tag等

| cs"'         | 将“替换为‘       |
| :----------- | :----------------- |
| cs'<q>       | 将’填好为<q>标签  |
| cst"         | 将tag              |
| ds"          | 删除“             |
| ysiw]        | 在当前word上添加[] |
| yss)         | 整行添加()         |
| 可视模式下S' | 给当前选择添加     |

左括号添加一个空格，右括号不添加空格

可视模式支持" ' ` [ ] { } ( ) >

# mark

\这里代表leader键

normal mode:

\m mark或者unmark光标下或前的word

\r 手动输入一个正则表达式

\n 清除标记

Visual mode:

\m mark或者unmark当前所选的文本

\r 基于当前所选手动输入一个正则表达式

Command line:

:Mark regexp mark或者unmark一个正则表达式

:Mark unmark全部

搜索：

```
\* 和 \/ 跳转到\m标记的下一个word
* 跳转到\r标记的下一个正则匹配
\# \? #方向相反
```



# Tabular

Tabular基于正则表达式对齐

:Tab /:

在当前行查找:字符，并根据:字符分割为3段（包括:本身，虽然没有format效果），然后按照默认规则（l1，左对齐，与分隔符间隔1个空格）对齐

比如 :Tabularize /,/r1c1l0

意思是查找正则表达式,，并以此作为分割符，将当前行分割为若干段，然后按照顺序依次匹配r1c1l0，重复循环匹配，即第4个匹配使用r1格式，

l r c 分别是靠左、靠右、居中对齐，其后面的数字表示在下一个分割段前插入的补齐空格数


# Gundo

| 按键     | 操作               |
| :--      | :--                |
| j/k      | 上下选择           |
| p        | 查看diff           |
| 回车     | 回滚到当前点       |
| 映射键F5 | 打开/关闭Gundo窗口 |
