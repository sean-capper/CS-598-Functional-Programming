-- Assignment 1
-- Exercise 8 & 9

-- abbrevName "daffy" "duck" -- returns "ddu"

abbrevName :: String -> String -> String
abbrevName first last = [head first] ++ take 2 last


-- stringMult "Hi" 2 -- returns "HiHi"
-- stringMult "Hi" 3 -- returns "HiHiHi"

stringMult :: String -> Int -> String
stringMult phrase n = concat $ replicate n phrase