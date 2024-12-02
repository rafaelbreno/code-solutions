import Data.List (sort)
import System.IO (withFile, IOMode(ReadMode), Handle, hIsEOF, hGetLine)

main :: IO ()
main = do
  result <- withFile "input.txt" ReadMode processFile 
  putStrLn $ "Result: " ++ show result

processFile :: Handle -> IO (Int, Int)
processFile h = do 
  numbers <- readNumbers h ([],[])
  -- INFO: 
  -- Just learned that I could've declared multiple values in
  -- a single `let` statement, the more you know.
  let (leftNumbers, rightNumbers) = numbers
      sortedNumbers = zip (sort leftNumbers) (sort rightNumbers)
      -- INFO: This is a beauty.
      diffs = map (abs . uncurry(-)) sortedNumbers
      sims = map (uncurry(*)) (processSimilarity leftNumbers rightNumbers)
  return $ (sum diffs, sum sims)

readNumbers :: Handle -> ([Int], [Int]) -> IO ([Int], [Int])
readNumbers h acc = do 
  isEOF <- hIsEOF h
  if isEOF 
    then return acc 
  else do 
    line <- hGetLine h 
    let (n1, n2) = processLine line
    readNumbers h (appendLists acc n1 n2)
    where
      processLine :: String -> (Int, Int)
      processLine line = 
            let [n1, n2] = map read (words line)
            in (n1, n2)

      appendLists :: ([Int], [Int]) -> Int -> Int -> ([Int], [Int])
      appendLists (leftNumbers, rightNumbers) n1 n2 = (n1:leftNumbers, n2:rightNumbers)

processSimilarity :: [Int] -> [Int] -> [(Int, Int)]
processSimilarity l1 l2 = 
  [(x, length (filter (== x) l2)) | x <- l1]

todo :: a 
-- Todo implements a similar `todo!()` from Rust.
todo = case undefined of {}
