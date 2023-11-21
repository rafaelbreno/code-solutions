-- gcd(Greatest Common Divisor)
-- Euclidean implementation 
gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' a b = gcd' b (a `mod` b)

-- lcm(Least Common Multiple)
lcm' :: Int -> Int -> Int
lcm' a b = abs (a * b) `div` gcd' a b

-- smallestMultiple implementation
-- foldl1 f() [1.n]
--  f(f(f(f(1, 2), 3), ..), n)
smallestMultiple :: Int -> Int -> Int
smallestMultiple a b 
  | a > b = foldl1 lcm' [b..a]
  | otherwise = foldl1 lcm' [a..b]

main :: IO ()
main = do
  putStrLn $ "Smallest Multiple 1..20 : " ++ show (smallestMultiple 1 20)
