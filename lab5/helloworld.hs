import System.Environment

--module Main where
--import qualified Data.Map as Map

{-main:: IO()
main = putStrLn "Hello Wordl!"

--java optional
--main:: IO String
--main = getline

main2::IO()
main2 = do
 name<-getLine --wyciagniecie czegos z kontenera
 let msg = "Hello " ++ name ++ "!"
 putStrLn msg
 -}

main::IO()
main = do
 let file = "test.txt"
 fileString <- readFile file
 let singlewords = words fileString
 putStrLn fileString
 print singlewords
 
 
count::Eq a => a -> [a] -> Int
count x = length . filter (x==)  

