main :: IO ()
main = do
    contents <- readFile "2.dat"
    let firstLine = head (lines contents)
        ranges    = splitBy ',' firstLine
        nums      = concatMap expandRange ranges
        goodNums  = filter isInvalidId nums
    print (sum goodNums)

splitBy :: Char -> String -> [String]
splitBy _ ""     = [""]
splitBy d (c:cs)
    | c == d    = "" : rest
    | otherwise = (c : head rest) : tail rest
  where
    rest = splitBy d cs

expandRange :: String -> [Int]
expandRange s =
    let [a,b] = splitBy '-' s
    in [read a .. read b]

isInvalidId :: Int -> Bool
isInvalidId n =
    let s   = show n
        len = length s
        -- i runs from 1 to len/2, and must divide len
        possible i = len `mod` i == 0 &&
                     concat (replicate (len `div` i) (take i s)) == s
    in any possible [1 .. len `div` 2]
