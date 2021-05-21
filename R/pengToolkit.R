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
            "##################################################"),
          file = file.path(dir, filename),
          sep = "\n")
    print(paste0("You successfully create file: ", filename))
  }
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
    r[ "CRAN" ] <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"; # mirror address of cran
    # r <- r[-which(names(r) == "CRANextra")]
    options( repos = r )
    BioC <- getOption( "BioC_mirror" ); # set bioconductor mirror for users in China
    BioC[ "BioC_mirror" ] <- "https://mirrors.ustc.edu.cn/bioc/"; # mirror address of bioconductor
    options( BioC_mirror = BioC )
    print("Now you successfully take a ladder, go ahead without any restrictions!")
  } else if (loc == "reset") {
    options( BioC_mirror = NULL )
    options( repos = NULL )
    print("You dropped the ladder~")
  } else {
    print("Don't support other regions yet. Sorry!")
  }
}

#' This is some description of this function.
#' @title receive a vector of packages and install them from cran or bioconductor
#'
#' @description today,I create my third function,a very usrful function.
#'
#' @details you can use this function to download a batch of uninstalled packages from CRAN or bioconductor with judment if exists.
#'
#' @param my_packages input a vector of your packages
#'
#' @return information about what did the function do
#' @keywords boost_install_packages
#' @export
#' @examples
#' boost_install_packages(c("devtools", "roxygen2", "testthat"))
#' boost_install_packages(my_packages = c("devtools", "roxygen2", "testthat"))
boost_install_packages <- function(my_packages = my_packages) {
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
      print(paste0(my_packages, " is already installed."))
    }
  })
  print(paste0(paste(my_packages, collapse=", "), " are already in your computer."))
}
