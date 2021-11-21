module Main where

fac :: (Integral a) => a -> a
fac n = product [1..n]

giveAseat :: Integral a => a -> a -> a
giveAseat n m = (fac n) * m

main :: IO ()
main = do
    line <- getLine
    let a = (read (takeWhile (/= ' ') line) :: Int)
    let b = (read (drop 1 (dropWhile (/= ' ') line)) :: Int)
    print(giveAseat a b)
