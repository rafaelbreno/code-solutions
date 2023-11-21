fibonacci :: Int -> Int
fibonacci n = fibs !! n 
  where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = do
  let evenSum = sum [fib | i <- [0..limit], let fib = fibonacci i, fib <= 4_000_000, even fib]
  putStrLn $ "Sum = " ++ show evenSum
  where
    limit = head $ dropWhile (\i -> fibonacci i <= 4_000_000) [0..]
