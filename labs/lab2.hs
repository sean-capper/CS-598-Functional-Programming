-- Sean Capper
-- Lab 2
import Data.List

-- valid triangles list comprehension
valid_triangles = [ (a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a + b > c, a + c > b, b + c > a ]

-- valid triangles filter
validTriangle :: [Int] -> Bool
validTriangle sides = do
                        let t = sort sides
                        let s1 = head t
                        let s2 = t !! 1
                        let s3 = last t
                        if s1 + s2 > s3 then True
                        else False

valid_triangles' = filter validTriangle [ [a,b,c] | a <- [1..10], b <- [1..10], c <- [1..10]]

-- valid triangles lamda
valid_triangles'' = filter (\(x, y, z) -> x + y > z && x + z > y && y + z > x) [ (a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10]]
