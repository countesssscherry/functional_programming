module Main where

import Data.Sequence as S



import Data.Char (chr)


loadQueue num = S.fromList [chr num..'z']


main :: IO ()
main = do
    putStrLn ""

    putStrLn "\n\nКількість символів:"
    num' <- getLine
    let num = 123 - read num':: Int

    let queue = loadQueue num
    print(queue)
    putStrLn "\n\nКількість літер у слові:"
    a' <- getLine
    let n = read a':: Int


    let s = S.take n queue
    print (s)
    putStrLn ""
    putStrLn ""
