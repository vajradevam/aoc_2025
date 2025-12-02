main = do
  xs <- lines <$> readFile "1.dat"
  print $ snd $ foldl f (50,0) xs
  where
    f (p,c) (d:ns) =
      let s  = read ns
          ct = c + s `div` 100
          r  = s `mod` 100
      in if d=='R'
         then let w = fromEnum (p + r >= 100)
              in ((p + r) `mod` 100, ct + w)
         else let w = fromEnum (p > 0 && p - r <= 0)
              in ((p - r) `mod` 100, ct + w)