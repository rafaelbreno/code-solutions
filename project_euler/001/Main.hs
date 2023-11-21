{-- multipleOfFiveOrThree is a function to check if a
 - given number is multiple of 3 or 5. --}
multipleOfFiveOrThree :: Int -> Bool
multipleOfFiveOrThree n = n `mod` 3 == 0 || n `mod` 5 == 0

{-- filterMultiples is a function that filters out numbers from a
 - List using multipleOfFiveOrThree function. --}
filterMultiples :: [Int] -> [Int]
filterMultiples = filter multipleOfFiveOrThree

main :: IO ()
main = do
  {-- [1..999] is a sugar syntax to generate a list of item from 1 to 999 --}
  let numbers = [1..999]
  let multiples = filterMultiples numbers
  let total = sum multiples
  putStrLn $ "Sum equal to " <> show total
