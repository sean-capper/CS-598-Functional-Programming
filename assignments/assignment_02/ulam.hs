ulam :: Int -> String
ulam n
    | n == 1 = show n
    | even n = show n ++ " -> "++ ulam nextEven
    | otherwise = show n ++ " -> " ++ ulam nextOdd
    where
        nextEven = div n 2
        nextOdd = 3 * n + 1