module Main where

f :: Floating a => a -> a
f x = log(1+ x * x) / (2 * x - 1)

-- метод правих проямокутників
rightRect :: Double -> Double -> Integer -> (Double -> Double) -> Double
rightRect xmin xmax intervals f =
    let step = stepOne xmin xmax intervals
        s  = sumOne (xmin + step) xmax step f
    in s * step

-- метод трапецій
trapez :: Double -> Double -> Integer -> (Double -> Double) -> Double
trapez xmin xmax intervals f =
    let step = stepOne xmin xmax intervals
        s  = sumOne (xmin + step) (xmax - step) step f
    in (s + (f xmin + f xmax)/2) * step


-- просумувати всі значення функції
sumOne :: Double -> Double -> Double -> (Double -> Double) -> Double
sumOne xFirst xLast step f = sum $ map f [xFirst, xFirst + step .. xLast]

-- додати різницю кроку до значення
stepOne :: Double -> Double -> Integer -> Double 
stepOne xmin xmax intervals = (xmax - xmin) / fromInteger intervals

main :: IO ()
main = do
    print (rightRect 1.2 2.8 100000 f)
    print (trapez 1.2 2.8 100000 f)



