-- isPrime check if a given number is a prime
isPrime :: Int -> Bool
isPrime n 
  | n <= 1 = False
  | otherwise = all (\x -> n `mod` x /= 0) [2..(floor . sqrt $ fromIntegral n)]

-- primes represents an infinite list of prime numbers
primes :: [Int]
primes = filter isPrime [2..]

-- Factoring a number
primeFactors :: Int -> [Int]
primeFactors n = factor n primes
  where
    factor n (p:ps)
      | n < 2 = []
      | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
      | otherwise = factor n ps

main :: IO ()
main = do
  let primeNumber = 600851475143
  let factors = primeFactors primeNumber
  putStrLn $ "Highest prime factor: " ++ show (last factors)
  --let evenSum = sum [fib | i <- [0..limit], let fib = fibonacci i, fib <= 4_000_000, even fib]
  --putStrLn $ "Sum = " ++ show evenSum
  --where
    --limit = head $ dropWhile (\i -> fibonacci i <= 4_000_000) [0..]
