module Main where

import Data.List.Split
import qualified Data.Char as Char

wordsOne   :: String -> [String]
wordsOne s =  case dropWhile Char.isSpace s of
                      "" -> []
                      s' -> w : wordsOne s''
                            where (w, s'') = break Char.isSpace s'

filterList list = filter ((even).snd) (arrayToTwoTuple list)

arrayToTwoTuple :: [String] -> [(Int,Int)]
arrayToTwoTuple = map (toTwoTuple.splitOn "/")
    where
      toTwoTuple :: [String] -> (Int, Int)
      toTwoTuple [a, c] = (read a :: Int, read c)

arrayFromTwoTuple :: [(Int,Int)] -> [String] 
arrayFromTwoTuple = map (fromTwoTuple)
    where
      fromTwoTuple :: (Int, Int) -> String
      fromTwoTuple (a, c) = show a ++ "/" ++ show c 


main :: IO ()
main = do 
    print (arrayFromTwoTuple (filterList ["1/2","1/4", "1/5", "1/6"]))
