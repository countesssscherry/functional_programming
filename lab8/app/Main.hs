{-# LANGUAGE ParallelListComp #-}
module Main where


data Polynomial a = P [a] deriving Show

nTuple :: [(a, a, a)] -> Integer -> Integer -> [a]
nTuple list group position = [ fst x | x <- (concat [ fst x | x <- (zip [(zip[t1, t2, t3][0..]) | (t1, t2, t3) <- list ] [0..]) , snd(x) == group ]) , snd(x) == position]


polynomRes exp = do
    let pow1 = snd (snd (snd exp))
    let pow2 = snd (fst (snd exp))
    let x = fst (snd (snd exp))
    let y = fst (fst (snd exp))
    let sign = fst exp
    if pow1 /= pow2 then 0-999
    else do
        if pow1 == 2 then do
            (x-y)*(x+y)
        else do
            if sign == '-' then (x-y)*(x*x+x*y+y*y)
            else (x+y)*(x*x-x*y+y*y)

polynom exp = do
    let pow1 = snd (snd (snd exp))
    let pow2 = snd (fst (snd exp))
    let x = fst (snd (snd exp))
    let y = fst (fst (snd exp))
    let sign = fst exp
    if pow1 /= pow2 || (pow1 /= 2 && pow1 /= 3) || (sign /= "+" && sign /= "-") then show "wrong expresion"
    -- if pow1 /= pow2 then -999
    else do
        if pow1 == 2 then do
            show ("(" ++ show x ++ "+" ++ show y ++ ")(" ++ show x ++ "-" ++ show y ++ ")")
            --fromIntegral (x-y)*(x+y)
        else do
            
            if sign == "-" then "(" ++ show x ++ sign ++ show y ++ ")(" ++ show x ++ "+" ++ show x ++ show y ++ "+" ++ show y ++ ")"
            else "(" ++ show x ++ sign ++ show y ++ ")(" ++ show x ++ "+" ++ show x ++ show y ++ "-" ++ show y ++ ")"

            

main = do
    putStrLn ""
    putStrLn ""
    putStrLn "Число х"

    x' <- getLine
    let x = read x':: Int

    putStrLn "Число у"

    y' <- getLine
    let y = read y':: Int

    putStrLn "Знак"
    sign <- getLine
    putStrLn "Степінь"
    power' <- getLine
    let power = read power':: Int

    putStrLn ""
    putStrLn "Загальний вигляд:"
    putStrLn (polynom (sign,(('x', power), ('y', power))))
    putStrLn "\nПри заданих х та у:"
    putStrLn(polynom (sign,((x, power), (y, power))) )
    putStrLn "Результат"
    print (polynomRes (head sign, ((x, power), (y, power))))
    putStrLn ""
    putStrLn ""
    putStrLn ""