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
gitte 地址：https://github.com/mugpeng/pengToolkit

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
> boost_install_packages(c("ggpubr", "stringr", "ggdark"), loaded = T)
[1] "ggpubr is already installed."
[1] "stringr is already installed."
[1] "ggdark is already installed."
[1] "ggpubr, stringr, ggdark are already in your computer."

Attaching package: ‘stringr’

The following object is masked _by_ ‘.GlobalEnv’:

    words

$ggpubr
 [1] "ggpubr"        "ggplot2"       "wordcloud2"    "readr"        
 [5] "janeaustenr"   "dplyr"         "tidytext"      "jiebaR"       
 [9] "jiebaRD"       "rvest"         "RevoUtils"     "stats"        
[13] "graphics"      "grDevices"     "utils"         "datasets"     
[17] "pengToolkit"   "conflicted"    "RevoUtilsMath" "methods"      
[21] "base"         

$stringr
 [1] "stringr"       "ggpubr"        "ggplot2"       "wordcloud2"   
 [5] "readr"         "janeaustenr"   "dplyr"         "tidytext"     
 [9] "jiebaR"        "jiebaRD"       "rvest"         "RevoUtils"    
[13] "stats"         "graphics"      "grDevices"     "utils"        
[17] "datasets"      "pengToolkit"   "conflicted"    "RevoUtilsMath"
[21] "methods"       "base"         

$ggdark
 [1] "ggdark"        "stringr"       "ggpubr"        "ggplot2"      
 [5] "wordcloud2"    "readr"         "janeaustenr"   "dplyr"        
 [9] "tidytext"      "jiebaR"        "jiebaRD"       "rvest"        
[13] "RevoUtils"     "stats"         "graphics"      "grDevices"    
[17] "utils"         "datasets"      "pengToolkit"   "conflicted"   
[21] "RevoUtilsMath" "methods"       "base"         

Warning messages:
1: package ‘ggpubr’ was built under R version 4.0.5 
2: package ‘stringr’ was built under R version 4.0.5 
3: package ‘ggdark’ was built under R version 4.0.5 
```
