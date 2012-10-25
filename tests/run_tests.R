source('./R/package.R')

#If you dont have svUnit
if (!pack.installed("RUnit"))
  install.packages("RUnit")

library('RUnit')

source('sample.R')

test.suite <- defineTestSuite("example",
                              dirs = file.path("./tests"),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)