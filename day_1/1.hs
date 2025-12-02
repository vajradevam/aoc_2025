main :: IO ()
main = do
  xs <- lines <$> readFile "1.dat"
  print $ fst $ foldl f (0,50) xs
  where
    f (c,p) (d:ns) =
      let s = read ns
          p' = (p + if d == 'L' then -s else s) `mod` 100
      in (c + fromEnum (p' == 0), p')