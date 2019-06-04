-- triangles.hs
-- Prompts for and inputs the 3 edges of a triangle and
-- outputs whether the edges form a valid triangle or not.
import Data.List

main = do
        putStrLn "Enter side 1: "
        strSide1 <- getLine
        let intSide1 = read strSide1 :: Double

        putStrLn "Enter side 2: "
        strSide2 <- getLine
        let intSide2 = read strSide2 :: Double
        
        putStrLn "Enter side 3: "
        strSide3 <- getLine
        let intSide3 = read strSide3 :: Double
        
        let result = validTriangle intSide1 intSide2 intSide3
        
        if result 
            then print (show [intSide1, intSide2, intSide3] ++ " forms a valid triangle")
        else 
            print (show [intSide1, intSide2, intSide3] ++ " does not form a valid triangle")

validTriangle :: Double -> Double -> Double -> Bool
validTriangle a b c = do
                        let t = sort [a,b,c]
                        let s1 = head t
                        let s2 = t !! 1
                        let s3 = last t
                        if s1 + s2 > s3 then True
                        else False


