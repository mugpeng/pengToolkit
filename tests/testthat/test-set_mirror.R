context("set the mirror")

test_that("set_mirror change the mirror", {
  r <- NULL
  r[ "CRAN" ] <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
  set_mirror()
  expect_identical(getOption( "repos" ), r)
})
