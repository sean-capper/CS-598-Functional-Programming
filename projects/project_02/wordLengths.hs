--- Arthur Kotlyarsky and Sean Capper
-- wordLengths.hs

import System.IO
import Text.Printf
import Data.Map (fromListWith, toList)
import Data.List

main = do 
        -- read the file in
        wordList <- readFile "english.sorted"

        -- convert the lines to a list
        let words = lines wordList

        -- get a list of all lengths from the file
        let lengths = sort (nub (map length words))

        -- gets a list containing tuples that contain the (length of the words, all words that are that length)
        -- Prelude.reverse is used to make sure the words are in order from A -> Z
        let allWordsWithLengths = toList (fromListWith (++) [(fst x, [snd x]) | x <- (map mapWordsWithLengths (Prelude.reverse words))])

        -- gets a list of the first two words from each length
        let sampleWords = firstTwoSampleWords allWordsWithLengths

        -- get a list of tuples that contain the (length of the word, number of occurences of that length)
        let lengthsOccurences = sumOccurences (map length words)

        -- print the output
        putStrLn "Word Length\tOccurences\tSample Words\n"
        -- print lengths
        printOutput 1 lengths lengthsOccurences sampleWords


-- Takes a list of objects of typeclass Ord
-- * fromListWith takes a combining function and list of (key, value) pairs
-- * [(x,1) | x <- xs] = a list with wordLength as the key and 1 as the value
--   this will allow keys to be incremented based on number of occurences
-- * the (+) is the combining function, it will compare keys, and sum their values
--   whenever the keys are equal.
-- * toList converts the map returned from fromListWith back to a list
sumOccurences :: (Ord a) => [a] -> [(a, Int)]
sumOccurences xs = toList (fromListWith (+) [(x,1) | x <- xs])

-- maps a word to a tuple containing the length and the word itself
mapWordsWithLengths :: String -> (Int, String)
mapWordsWithLengths s = (length s, s)

-- gets the first two sample words of each length and stores them in a list
firstTwoSampleWords :: [(Int, [String])] -> [[String]]
firstTwoSampleWords [] = []
firstTwoSampleWords (x:xs) = do
                                let size = length (snd x)
                                if size == 1 then 
                                    [[head (snd x)]] ++ firstTwoSampleWords xs
                                else
                                    [[head (snd x), (snd x)!!1]] ++ firstTwoSampleWords xs


-- prints the final output
-- loop counter -> list of lengths that appears -> list of tuples (length, occurences) -> List of sample words
-- uses a counter to keep track of any lengths that may not have occured in the file
printOutput :: Int -> [Int] -> [(Int,Int)] -> [[String]] -> IO ()
printOutput _ _ [] _ = putStr ""
printOutput count lens (x:xs) (yys)
    | not (count `elem` lens) = do
                                    printf "%d\t\t0\n" count
                                    printOutput (count+1) lens (x:xs) yys
    | otherwise = do
                    let ys = head yys
                    if length ys == 1 then
                        printf "%d\t\t%d\t\t%s\n" (fst x) (snd x) (head ys)
                    else
                        printf "%d\t\t%d\t\t%s, %s\n" (fst x) (snd x) (head ys) (ys !! 1)
                    printOutput (count + 1) lens xs (tail yys)
