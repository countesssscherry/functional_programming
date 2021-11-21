{-# LANGUAGE MultiWayIf #-}
module Main where
import Data.Typeable

taylor k_ini k_n x = k_ini x * foldr (.) id (map (app k_n x) [2..100]) 0.5 
          where app k x n = (1+) . (k x n *)

expMy :: Fractional a => a -> a
expMy x = taylor (\x -> 1) k_n x 
          where k_n x n = x / fromIntegral (n-1)

addOne x = -(x -5)

multOne x = - (x * x)

y x = 
   if | (x <= 0 && x >= -2) -> expMy ( - 1 *  x + 2) + expMy (-1 * x / 3) -- (exp_my (- 1 * x + 2))  + (exp_my (-1 * x / 3))
      | (x <= 2 && x >= 0) -> expMy (addOne x) - expMy (multOne x)
      | otherwise -> 0.0


main :: IO ()
main = print(y 1)