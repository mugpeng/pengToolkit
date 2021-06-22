pacman::p_load(devtools, roxygen2, testthat)

# start with welcome
.First <- function(){
  message("Hello Peng!")
  message(paste0("Welcome at ", date()))
  # 配置install 命令使用的线程
  n <- parallel::detectCores()
  options(Ncpus = n-1)
  n2 <- getOption("Ncpus", 1L)
  message(paste0("We will use ", n2, " cores for installing.\n"))
}


# some useful packages
pacman::p_load(pacman, pengToolkit)



# finish with goodbye
.Last <- function(){
  cat("\n Goodbye,", date(), "\n")
}

