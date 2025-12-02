main :: IO ()
main = do
    contents <- readFile "2.dat"
    let firstLine = takeWhile (/= '\n') contents
        ranges    = splitBy ',' firstLine
        nums      = concatMap expandRange ranges
        goodNums  = filter halfEqual nums
    print (sum goodNums)

splitBy :: Char -> String -> [String]
splitBy _ "" = [""]
splitBy d (c:cs)
    | c == d    = "" : rest
    | otherwise = (c : head rest) : tail rest
  where
    rest = splitBy d cs

expandRange :: String -> [Int]
expandRange s =
    let [a, b] = splitBy '-' s
    in [read a .. read b]

halfEqual :: Int -> Bool
halfEqual n =
    let s = show n
        len = length s
        (l, r) = splitAt (len `div` 2) s
    in even len && l == r
