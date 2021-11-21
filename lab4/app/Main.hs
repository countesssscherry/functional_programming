module Main where

import Data.List
import Data.Function ( on )
import Data.Maybe(fromMaybe)

-- індекс елемента перший та останній 
elemIndex' x = fromMaybe (-1) . elemIndex x

reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x:xs) =  x:reverseList xs

findLastIndex a list = length list - fromMaybeInt (elemIndex a (reverseList list))
 
fromMaybeInt mx = do
    case mx of
        Just x  -> x
        Nothing -> -1

 ---- повертає елементи та найбільшу кількість входжень
grEq [] = []
grEq l@(x:xs) = (length $ filter (==x) l, x) : grEq (filter (/=x) l)
 
getMaxs :: Eq a => [(a, b)] -> [(a, b)]
getMaxs [] = []
getMaxs l@((n,v):xs) = takeWhile ((==n).fst) l
 
repeated :: [Integer] -> [(Int, Integer)]
repeated = getMaxs . sortBy (flip compare `on` fst) . grEq

---- видалення дублікатів
rmdups :: (Ord a) => [a] -> [a]
rmdups = map head . group . sort
 
-- main = print . task $ [1, 2, 3]
main :: IO ()
main =  do 
    -- -- first
    -- putStrLn ""
    -- putStrLn ""
    -- print("First index of element: ")
    -- print(  fromMaybeInt (elemIndex 1  [1, 2, 1, 56, 7]  ))
    -- print("Last index of element: ")
    -- print(  findLastIndex 1 [1, 2, 1] )
    -- putStrLn ""
    -- putStrLn ""
    -- -- second
    -- putStrLn ""
    -- putStrLn ""
    -- print("The most repeatable elements (number of repeats, element)")
    -- print(  repeated [1, 2, 4, 1, 2, 4, 1, 1, 1]  )
    -- putStrLn ""
    -- putStrLn ""
    -- third 
    putStrLn ""
    putStrLn ""
    print("Whithout duplicates")
    print(  rmdups [1, 2, 1, 1, 4, 1]  )
    putStrLn ""
    putStrLn ""

