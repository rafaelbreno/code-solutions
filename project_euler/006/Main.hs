main :: IO ()
main = do
  let numbers = [1..100]
  let sumOfSq = sumOfSquares numbers
  let sqrOfSum = squareOfTheSum numbers
  let diff = sqrOfSum - sumOfSq
  putStrLn $ "Result: " <> show diff

sumOfSquares :: [Int] -> Int
sumOfSquares [x] = x*x
sumOfSquares (x:xs) = (x * x) + sumOfSquares xs

squareOfTheSum :: [Int] -> Int
squareOfTheSum n = x * x where x = sum n

todo :: a 
-- Todo implements a similar `todo!()` from Rust.
todo = case undefined of {}
