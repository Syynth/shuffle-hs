
module Main where

import System.Environment
import System.Directory
import System.IO
import System.Random
import Data.List

main = do
  -- get the program arguments
  args <- getArgs
  -- store the first argument (which is assumed to be a )
  let fname = args !! 0
  -- assume first argument is a file, and read it into memory
  contents <- readFile fname
  -- break the file contents into an array of strings
  let lines' = lines contents
  -- print something to prove i'm not insane!
  putStrLn $ "the file " ++ fname ++ " contains " ++ (show $ length lines') ++ " lines\n"
  -- print out the contents of the files
  putStrLn $ concatMap (++ "\n") lines'
  -- a little flair...
  putStrLn "I will now shuffle the lines into a new order...\n...\n"
  -- grab a time-based random number generator
  stdGen <- getStdGen
  -- and for the real magic!
  putStrLn $ concatMap (++ "\n") $ shuffleList stdGen lines'
  -- yaay. we did it.
  putStrLn "tada!"

shuffleList :: (Eq a) => StdGen -> [a] -> [a]
shuffleList _ [] = []
shuffleList r l = head' : shuffleList r' tail'
  where
    (pos, r') = randomR (0, length l - 1) r
    head'     = l !! pos
    tail'     = delete head' l
