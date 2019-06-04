-- guessNumber.hs
-- Compile with 'ghc guessNumber.hs' and and run './guessNumber',
-- or run with 'runghc guessNumber.hs'.

module Main where

    import System.Random
    
    -- main :: IO ()
    main = do putStrLn "Try to guess my number (1-100)..."
              secret <- randomRIO(1, 100)
              play secret
    
    
    -- play :: Int -> IO ()
    play secret = do guesses <- playGame secret 0 -- 0 is initial # of guesses
                     putStrLn $ "You won in " ++ show guesses ++ " guesses!"
                     -- The "$" is used to avoid using parentheses.
    
    
    -- playGame :: Int -> Int -> IO Int
    playGame secret guesses = do putStr "? "
                                 input <- getLine -- input is a IO string
                                 let guess = read input :: Int -- convert to Int
                                 if guess == secret then
                                    do return (guesses + 1)
                                 else if guess < secret then
                                    do putStrLn "Too small!"
                                       playGame secret (guesses + 1)
                                 else
                                    do putStrLn "Too big!"
                                       playGame secret (guesses + 1)
    