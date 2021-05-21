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