isPalindrome :: Int -> Bool
isPalindrome n = str == reverse str 
  where str = show n

highestPalindrome :: Int 
highestPalindrome = maximum [ x * y | x <- [100..999], y <- [100..999], isPalindrome (x * y)]

main :: IO ()
main = do
  putStrLn $ "Highest prime factor: " ++ show highestPalindrome
