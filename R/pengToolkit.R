#' This is some description of this function.
#' @title A head comment template auto-generator
#'
#' @description today,I create my first function,a very usrful function.
#'
#' @details you can use this function to create your header in the script.
#'
#' @param project input a character type or not
#' @param filename input a character type or not
#' @param author input a character type or not
#' @param dir input a character type or not
#'
#' @return file a new file with designed header
#' @keywords make_r_template
#' @export
#' @examples
#' make_r_template()
#' make_r_template(project = "How to Fire My Boss.", filename = "01-preparation.R", author = "Tony", dir = getwd())
make_r_template <- function(
  filename = "file.R", project = "Rescue the Princess",
  author = "Peng", dir = getwd())
{
  if (file.exists(file.path(dir, filename))) invisible(NULL)
  else{
    if (!grepl(".R$", filename)) filename <- paste0(filename, ".R")
    write(c("##################################################",
            paste0("## Project: ", project),
            paste0("## File name: ", filename),
            paste0("## Date: ", date()),
            paste0("## Author: ", author),
            paste0("## R_Version: ", R.version.string),
            paste0("## R_Studio_Version: ", RStudio.Version()$version),
            paste0("## Platform Version: ", osVersion),
            "##################################################"),
          file = file.path(dir, filename),
          sep = "\n")
    message(paste0("You successfully create file: ", filename))
  }
  file.edit(file.path(dir, filename))
}

#' This is some description of this function.
#' @title set-up mirror in China
#'
#' @description today,I create my second function,a very usrful function.
#'
#' @details you can use this function to change ur cran&&bioconductor mirrors if you are in China.
#'
#' @param loc input "China" means change mirror
#' @param loc input "recover" means drop the mirror
#'
#'
#' @return nothing but love
#' @keywords set_mirror
#' @export
#' @examples
#' set_mirror()
#' set_mirror("China")
set_mirror <- function(loc = "China") {
  if (loc == "China") {
    # clean previous mirror
    options( BioC_mirror = NULL )
    options( repos = NULL )

    r <- getOption( "repos" );# set CRAN mirror for users in China
    r[ "CRAN" ] <- "https://mirrors.ustc.edu.cn/CRAN/"; # mirror address of cran
    # r <- r[-which(names(r) == "CRANextra")]
    options( repos = r )
    BioC <- getOption( "BioC_mirror" ); # set bioconductor mirror for users in China
    BioC[ "BioC_mirror" ] <- "https://mirrors.ustc.edu.cn/bioc/"; # mirror address of bioconductor
    options( BioC_mirror = BioC )
    message("Now you successfully take a mirror, go ahead without any restrictions!")
  } else if (loc == "reset") {
    options( BioC_mirror = NULL )
    options( repos = NULL )
    message("You dropped the mirror. PONG!! ")
  } else {
    message("Don't support other regions yet. Sorry!")
  }
}

#' @title receive a vector of packages and install them from cran or bioconductor
#'
#' @description today,I create my third function,a very useful function.
#'
#' @details you can use this function to download a batch of uninstalled packages from CRAN or bioconductor and stop if exists.
#'
#' @param my_packages input a vector of your packages
#' @param loaded logical
#' @param parallels logical or numeric
#' @param mirror logical
#' @param jobs logical
#'
#' @return information about what did the function do
#' @keywords boost_install_packages
#' @export
#' @examples
#' boost_install_packages(c("devtools", "roxygen2", "testthat"))
#' boost_install_packages(my_packages = c("devtools", "roxygen2", "testthat"))
boost_install_packages <- function(my_packages = my_packages, loaded = F, parallels = F, mirror = F, jobs = F) {
  if (jobs == T) {
    message("Now will use jobs for installing. HAPPY! console is free now!")
    job::job({sapply(my_packages, simplify = F, function(my_packages = my_packages) {
      if (!my_packages %in% rownames(installed.packages())) {
        CRANpackages <- available.packages()
        if (my_packages %in% rownames(CRANpackages)) {
          install.packages(my_packages)
        } else {
          BiocManager::install(my_packages,
                               suppressUpdates = F,
                               ask = F)
        }
      }
    })}, packages = NULL)
    message(paste0(paste(my_packages, collapse=", "), " are already in your computer."))
  } else {
    sapply(my_packages, simplify = F, function(my_packages = my_packages) {
      if (!my_packages %in% rownames(installed.packages())) {
        CRANpackages <- available.packages()
        if (my_packages %in% rownames(CRANpackages)) {
          install.packages(my_packages)
        } else {
          BiocManager::install(my_packages,
                               suppressUpdates = F,
                               ask = F)
        }
      } else {
        message(paste0(my_packages, " is already installed."))
      }
    })
    message(paste0(paste(my_packages, collapse=", "), " are already in your computer."))
  }
  if (loaded == T) {
    sapply(my_packages, simplify = F, function(my_packages) library(my_packages, character.only= T, quietly = T))
    message(paste0(paste(my_packages, collapse=", "), " are  also successfully loaded in your namespace."))
  }
  if (parallels == T) {
    Ncpus <- parallel::detectCores()
    if (Ncpus >= 8) {
      Ncpus <- 8
    }
    else {Ncpus <- parallel::detectCores() - 1}
  } else if (class(parallels) == "numeric") {
    max_cpu <- parallel::detectCores()
    Ncpus <- parallels
    if (Ncpus >= max_cpu) {
      Ncpus <- max_cpu - 1
      if (Ncpus >= 8) {
        Ncpus <- 8
      }
      message("You think too high to your cpu, I will set it to a safe number.")
    } else if (Ncpus >= 8) {
      Ncpus <- 8
      message("I think there is no need for you to recruit so many cpus.")
    }
    options(Ncpus = Ncpus)
    message(paste0("We will use ", Ncpus, " cores for installing."))
    message("You can set ur parallels back by: options(Ncpus = 1)")
  }
  if (mirror == T) {
    set_mirror()
    message("You can set ur mirror back by: set_mirror('reset')")
  }
}


#' #' This is some description of this function.
#' #' @title update this package itself
#' #'
#' #' @description update this package from github
#' #'
#' #'
#' #'
#' #' @return nothing but love
#' #' @keywords set_mirror
#' #' @export
#' #' @examples
#' #' update_myself()
#'
#' # update_myself <- function() {
#' #   message("upgrading this package from github mugpeng/pengToolkit")
#' #   if (grepl("pengToolkit", paste((.packages()), collapse = ", ")) == T) {
#' #     detach("package:pengToolkit")
#' #   }
#' #   devtools::install_github("mugpeng/pengToolkit")
#' #   library(pengToolkit)
#' # }

#' @title add funtions that you want to store them in a function.R file
#'
#' @description today,I create my fourth function,a very useful function.
#'
#' @details you can use this function to receive any funtions that you want to store them in a function.R file
#' and source them automatically into your environment.
#'
#' @param virable param my_functions input any functions that you want to
#'
#'
#' @return information about what did the function do
#' @keywords add_function
#' @export
#' @examples
#' add_function("test001", "test002")
#' add_function(source_fun = T)

add_function <- function(..., source_fun = F) {
  if (!file.exists("./my_function.R")) file.create("./my_function.R")
  if (source_fun == F) {
    var_args <- list(...)
    x <- var_args[[1]]
    var_args[1] <- NULL
    sink(file = "./my_function.R")
    cat(paste0(x, " <-"))
    tmp <- get(x)
    print(tmp)
    sink()
    for (i in var_args) {
      sink(file = "./my_function.R", append = T)
      cat(paste0(i, " <-"))
      tmp <- get(i)
      print(tmp)
      sink()
    }
    message("Now you can find your functions in : ./my_function.R")
  }
  else {
    source("./my_function.R")
    message("Your functions are in environment now.")
  }
}
