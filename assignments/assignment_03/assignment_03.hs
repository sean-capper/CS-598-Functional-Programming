intsFromTo :: Int -> Int -> [Int]
intsFromTo n m
    | n <= m = n:[] ++ intsFromTo (n+1) m
    | otherwise = []

removeOdd :: [Int] -> [Int]
removeOdd [] = []
removeOdd (x:xs)
    | odd x = removeOdd xs
    | otherwise = [x] ++ removeOdd (xs)

countTrue :: [Bool] -> Int
countTrue [] = 0
countTrue (x:xs)
    | x == True = 1 + countTrue xs
    | otherwise = countTrue xs

removeOdd' :: [Int] -> [Int]
removeOdd' list = [ a | a <- list, even a ]

nonEmptyStr :: String -> Bool
nonEmptyStr str 
    | str == "" = False
    | otherwise = True

replaceEmptyStr :: String -> String
replaceEmptyStr str 
    | str == "" = "-1"
    | otherwise = str
