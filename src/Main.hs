
module Main where

import System.Environment
import System.Directory
import System.IO
import Data.List

main = do
  args <- getArgs
  let fname = args !! 0
  contents <- readFile fname
  putStr contents
