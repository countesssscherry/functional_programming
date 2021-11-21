module Main where

-- методом перебору шукаємо корінь
tryFunc x = let 
    newGuess = 3 ** x - 5 * x + 2
    new_x = x + 0.1
    in if newGuess == 0.0
       then x
       else tryFunc new_x 


root :: Double -> Double

-- допоміжна функція
-- аргументи:
-- лівий кінець відрізку, на якому шукаємо корінь,
-- правий кінець відрізка,
-- знак функції на лівому кінці (True означає > 0, False означає <= 0),
-- знак функції на правому куску відрізка,
-- задана точність вирахунку кореня.
root' :: Double -> Double -> Bool -> Bool -> Double -> Double

-- задаємо функцію
func :: Double -> Double
func x = 3 ** x - 5 * x + 2

-- задаємо проміжок, знак функції і точність вирахунку
root eps = root' 0.0 (pi / 2) True False eps

-- метод бісекції
root' a b fa fb eps | (b - a) < eps = a
            | fa == (func ((b + a) / 2) > 0.0) = root' ((b + a) / 2) b (func ((b + a) / 2) > 0.0) fb eps
            | otherwise = root' a ((b + a) / 2) fa (func ((b + a) / 2) > 0.0) eps


main :: IO ()
main = do
    print(root 0.1)
    
