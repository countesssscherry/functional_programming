{-# LANGUAGE FlexibleContexts #-}
module Main where
                 
findR a b = sqrt (fromIntegral $  a*a + b*b)

findCos a r = a / r
findSin b r = b / r 

-- showReal = print(findR )
replaceI = map (\c -> if c=='i' || c == '+' then ' '; else c)

replaceAll = map (\c -> if c=='i' || c == '+' || c == 'f' || c == '^' || c == 'e' then ' '; else c)

f :: [String] -> [Int]
f = map read

getCoef str =  f (words (replaceI str))

firstCoef :: [a] -> a
firstCoef l = l !! 0
lastCoef :: [a] -> a
lastCoef l = l !! 1

showReal l = do
    let coef1 = firstCoef (getCoef l)
    let coef2 = lastCoef (getCoef l)
    let r = findR coef1 coef2 
    show (r) ++ "e^if"


multToShow a b = fromIntegral $ a * b

-- multShow l = do
--     let l2 = map replaceAll l
--     print(multToShow (firstCoef l2) (lastCoef l2))

main :: IO ()
-- main = print(map getCoef ["3+i4", "10+i15"])
main = do
    putStrLn ""
    putStrLn ""
    print(map showReal ["3+i4", "10+i15"])
    putStrLn ""
    putStrLn ""
