module Main where

import Data.List
import Data.Vector
 
 -- сортування вектора алгоритмом шелла

shellSort xs = Prelude.foldr (invColumnize (Prelude.map (Prelude.foldr insert []))) xs gaps
  where gaps = Prelude.takeWhile (< Prelude.length xs) $ iterate (succ.(3*)) 1
        invColumnize f k = Prelude.concat. transpose. f. transpose
                           . Prelude.takeWhile (not.Prelude.null). Data.List.unfoldr (Just. Prelude.splitAt k)

-- пошук в масиві
isPartOf [] _ = Nothing
isPartOf (x : xs) a | x == a = Just 0
                     | otherwise = fmap ((+) 1) (isPartOf xs a)

main :: IO ()
main = do
    let aToSort = [9,2,3,7,4,1,8,5]
    let aVect = fromList [9,2,3,7,4,1,8,5]
    putStrLn ""
    putStrLn ""
    print("vector: ")
    print(aVect)

    -- -- sorting
    -- putStrLn ""
    -- putStrLn ""
    -- print("shell sort result:")
    -- print(shellSort aToSort)
    -- putStrLn ""
    -- putStrLn ""

    -- search
    putStrLn ""
    putStrLn ""
    print("search result (index):")
    print(isPartOf aToSort 0)
    putStrLn ""
    putStrLn ""

