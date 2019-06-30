--- Arthur Kotlyarsky and Sean Capper
-- randomSeating.hs

import System.IO 
import System.Random
import System.Random.Shuffle

main = do
        -- Read roster file
          roster <- readFile "roster.txt"
          let students = lines roster
          
          -- Create generator to shuffle
          rng <- newStdGen
          
        -- Shuffles the list of students
          let shuffledStudents = shuffle' students (length students) rng
          
          -- Generate a list of seat numbers
          let seatNumbers = [2..25]

          -- shuffledSeatNumbers is a list containing the shuffled seat numbers
          let shuffledSeatNumbers = shuffle' seatNumbers (length seatNumbers) rng
          -- emptySeatNumbers is a list of seats that will never contain a student
          let emptySeatNumbers = take ((length seatNumbers)-(length students)) shuffledSeatNumbers
          
          -- starts the recusive function call
          printStrListLines 2 shuffledStudents emptySeatNumbers


-- base case for recursive function
-- Handles cases when there are no more students left in the list, but there are still empty seats
-- that need to be printed
printStrListLines :: Int -> [String] -> [Int] -> IO ()
printStrListLines n [] emptySeatNumbers = do
                                            if(n<=25) then
                                                do
                                                    -- handles the leading zero in single digit numbers
                                                    if(n<10) then
                                                        do
                                                            putStrLn ("cssemaclin0"++show(n)++"    ")
                                                    else
                                                        do
                                                            putStrLn ("cssemaclin"++show(n)++"    ")
                                                    -- call the function using recursion
                                                    printStrListLines (n+1) [] emptySeatNumbers
                                            else
                                                do
                                                    return ()
-- Handles normal recursive calls
-- Prints the list of seats containing a student and also any seats that do not contain a student
printStrListLines n (x:xs) emptySeatNumbers = do
                              if (n==2) then
                                  do
                                     putStrLn "HH 305 EXAM RANDOMIZED SEATING"
                                     putStrLn "-----"
                                     putStrLn "Row 1"
                                     putStrLn "-----"
                              else if (n==8) then 
                                  do
                                     putStrLn("-----")
                                     putStrLn("Row 2")
                                     putStrLn("-----")
                              else if (n==14) then
                                  do
                                     putStrLn("-----")
                                     putStrLn("Row 3")
                                     putStrLn("-----")
                              else if (n==20) then
                                  do
                                     putStrLn("-----")
                                     putStrLn("Row 4")
                                     putStrLn("-----")
                              else return () 
                              
                              if(n `elem` emptySeatNumbers) then
                                  do
                                    -- handles the leading zero in single digit numbers
                                    if(n<10) then
                                        do
                                            putStrLn ("cssemaclin0"++show(n)++"    ")
                                    else
                                        do
                                            putStrLn ("cssemaclin"++show(n)++"    ")
                                    -- call the function using recursion
                                    -- Iterate the seat number BUT NOT the student
                                    printStrListLines (n+1) (x:xs) emptySeatNumbers
                                     
                              else
                                   do
                                    -- handles the leading zero in single digit numbers
                                    if(n<10) then
                                        do
                                            putStrLn ("cssemaclin0"++show(n)++"    "++x)
                                    else
                                        do
                                            putStrLn ("cssemaclin"++show(n)++"    "++x)
                                    -- call the function using recursion
                                    -- Iterate the seat number AND the student
                                    printStrListLines (n+1) xs emptySeatNumbers