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
ps：很神奇，为什么在apply 族函数后用一个print，就可以抑制前者的默认输出呢？