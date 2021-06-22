# pengToolkit
 My useful R package.

## 功能介绍
一共三个函数：

```
pengToolkit::
pengToolkit::boost_install_packages  pengToolkit::set_mirror
pengToolkit::make_r_template  
```

- make_r_templete 
用来创建头文件：
```
##################################################
## Project:
## File name: test2.R
## Date: Wed May 19 18:24:26 2021
## Author: Peng
## R_Version: R version 4.0.5 (2021-03-31)
##################################################
```
- boost_install_packages
判断式安装R 包，先从cran 找，再从biocondunctor 找，如果都有，则会提示：
```
pengToolkit::boost_install_packages(c("ggplot2", "devtools"))
[1] "ggplot2 is already installed."
[1] "devtools is already installed."
[1] "ggplot2 devtools are already in your computer."
```

- set_mirror
自动将镜像配置，cran 对应清华源，bioconductor 对应中科大。
```
set_mirror() # 参数"China" 可有可无
set_mirror("reset") # 当你无需镜像之时，可以恢复默认设置
```

## 安装
境内用户，可以用下面的链接：
```
#安装官方包‘remotes’
install.packages("remotes")
#安装官方包‘git2r’
install.packages("git2r")

remotes::install_git("https://gitee.com/mugpeng/pengToolkit.git")
```

# 更新记录
gitee 地址：https://gitee.com/mugpeng/pengToolkit

## 0.0.1
初始版。

## 0.0.2
发布版。

set_mirror 函数添加恢复方法：
```
set_mirror("reset") # 当你无需镜像之时，可以恢复默认设置
```
## 0.0.3
对帮助文档进行了修改。
添加了依赖包设置。
添加了单元测试设置。

## 0.0.4
灵感来源于pacman::p_load()，如果可以安装包时增加选项，loaded, 如果为T，则判断式安装完包后，会加载它们。
```
> boost_install_packages(c("ggplot2","ggsci"), loaded = T)
[1] "ggplot2 is already installed."
[1] "ggsci is already installed."
[1] "ggplot2, ggsci are already in your computer."
[1] "ggplot2, ggsci are  also successfully loaded in your namespace."
Warning message:
package ‘ggsci’ was built under R version 4.0.5 
```

## 0.0.5
- 增加新的函数update_myself：
可以随时随地获得最新稳定版的这个包。
来源是github。

```
> update_myself()
upgrading this package from github mugpeng/pengToolkit
Downloading GitHub repo mugpeng/pengToolkit@HEAD
These packages have more recent versions available.
It is recommended to update all of them.
```

- 更新boost_install_packages，支持后台下载选项，支持多线程选项，支持镜像下载，修改输出信息内容。

```
> boost_install_packages("viridis", mirror = T, parallels = 2, jobs = T)
Now you successfully take a mirror, go ahead without any restrictions!
Now will use jobs for installing. HAPPY! console is free now!
Job launched.                                                                      
We will use 2 cores for installing.
You can set ur parallels back by: options(Ncpus = 1)
You can set ur mirror back by: set_mirror('reset')
```

jobs 选项调用job 包，可以直接调用后台安装。
ps：关于R 包的更新，墙裂推荐大噶使用Y 叔叔的rvcheck，好用极了~

## 0.0.6 
- 更新boost_install_packages 函数
修改了parallels 参数bug，并且设置了parallels 参数可以自定义的阈值上限，
最多只允许调用8个核心来安装包。

```
> boost_install_packages("paletteer", parallels = 100)
paletteer is already installed.
paletteer are already in your computer.
You think too high to your cpu, I will set it to a safe number.
We will use 3 cores for installing.
```

- 增加了函数add_function
可以直接添加函数到 ./my_function.R（需要将函数名改为字符串形式） 脚本内，解决主脚本因为函数定义而显得臃肿。

比如添加事先定义好的两个函数：
```
> add_function("test001", "test002")
Now you can find your functions in : ./my_function.R
```

再打开 ./my_function.R：
```
test001 <-function(x) {
  x + 1
}
test002 <-function(x) {
  x + 1
}

```

## 0.0.7

更新update_myself，解决因为环境中加载pengToolkit 而无法更新报错。
