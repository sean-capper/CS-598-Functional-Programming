-- example_lab01.hs

-- Multiply the first 5 positive numbers (1-5)
x1 = product [1..5]
-- Multiply the first 30 positive numbers (1-30)
x2 = product [1..30]
-- Add the numbers from 1 to 100
x3 = sum [1..100]
-- Add the odd numbers from 1 to 99
x4 = sum [1, 3..99]
-- Add the odd numbers from 1 to 99 using a list comprehension
x4' = sum [ x | x <- [1, 3..99] ]

-- What is the remainder when 456 is divided by 10?
-- mod as prefix function
x5 = mod 456 10
-- What is the remainder when 365 is divided by 7?
-- mod as infix function
x6 = 365 `mod` 7
-- Produce the first letter of the string "first".
f = head "first"
-- Drop the first letter from the string "rest".
est = tail "rest"
-- Get the second letter of the string "Haskell".
ha = take 2 "Haskell"
a = tail ha

ab = "Haskell" !! 1

ac = head (tail "Haskell")

-- Part (b)

-- In example_lab1.hs, define a function 'secondLastElem' that finds the 2nd
-- to last element of a list.
-- When you test the function in ghci, it should work like this:
-- Prelude> secondLastElem [1,2,3,4]
-- 3
-- Prelude> secondLastElem ['a'..'z']
-- 'y'
-- secondLastElem :: [a] -> a
secondLastElem a = last (init a)

-- Redefine secondLastElem' that uses a list comprehension to do the same thing as secondLastElem
-- secondLastElem' :: [a] -> a
secondLastElem' a = last [ x | x <- a, x /= (last a)]


-- Part (c)
-- In example_lab1.hs, define a function 'emphasize' that takes a string as input 
-- and returns the string surrounded with "!!!". 
-- When you test the function in ghci, it should work like this:
-- Prelude> emphasize "alert"
-- !!!alert!!!  
emphasize :: [Char] -> [Char]
emphasize xs = "!!!" ++ xs ++ "!!!"
