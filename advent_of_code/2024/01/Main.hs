import Data.List (sort)

main :: IO ()
main = do
  -- TODO:
  --  Room for improvement, here the whole file is 
  --  saved in-memory, instead we could go line by line.
  file_content <- readFile "input.txt"
  let results = map processLine (lines file_content)
  let (leftNumbers, rightNumbers) = unzip results
  let sortedLeftNumber = sort leftNumbers
  let sortedRightNumber = sort rightNumbers
  let sortedNumbers = zip sortedLeftNumber sortedRightNumber
  let processedNumbers = map processNumbers sortedNumbers

  print (sum ( map fromIntegral processedNumbers))

  where 
    -- processLine :: String -> ([Int], [Int]) -> ([Int], [Int])
    --processLine :: String -> IO ()
    processLine :: String -> (Int, Int)
    processLine line = 
      let [n1, n2] = map read (words line)
      in (n1, n2)
    processNumbers :: (Int, Int) -> Int
    processNumbers (n1, n2) = abs (n1 - n2)

todo :: a 
-- Todo implements a similar `todo!()` from Rust.
todo = case undefined of {}
