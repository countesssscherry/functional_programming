module Main where
import Data.List
import Data.Char

substr :: Int -> Int -> String -> String
substr m n str = take n (drop m str)

fromMaybeInt mx = do
    case mx of
        Just x  -> x
        Nothing -> -1


getSymbols contents = do
    let m = (elemIndices '(' contents) !! 0 
    let n = (elemIndices ')' contents) !! 0
    substr m n contents
    

 
getAllSymbols contents = do
    i <- [0..100]
    j <- [0..100]
    k <- takeWhile (\k -> (getSymbols contents)`elem` [['/']] ) [0..]
    return (i, j, k)

removePunc xs str = [ x | x <- xs, not (x `elem` str) ]

main = do
    line <- getLine
    writeFile "output.txt" $ line
    -- необхідно продовжувати, доки у рядку є символи дужок
    contents <- readFile "output.txt"

    -- print (substr m n contents)
    writeFile "file.txt" (removePunc (removePunc (getSymbols contents) "(") ")")
    