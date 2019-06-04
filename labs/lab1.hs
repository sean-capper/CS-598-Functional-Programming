-- Sean Capper
-- lab1.hs

-- Given two integers returns a pair (tuple) 
-- where the smaller of the two numbers is first.
-- Results of calling sort2
-- sort2 4 5        sort2 9 1
--  (4, 5)            (1, 9)
sort2 :: Int -> Int -> (Int, Int)
sort2 x y
    | y > x = (x, y)
    | otherwise = (y, x)

-- Computes the yearly interest for a given amount
-- of money. To keep it simple, the argument will 
-- be an integer dollar amount.
-- The interest rates for the account are computed as follows:
-- 0% per year on the first $999
-- 2% on every dollar from $1000 to $4,999		($4,000 in this range)
-- 4% for every dollar from $5000 to $19,999	($15,000 in this range)
-- 5% for every dollar from $20,000
-- interest :: Int -> Double
interest amount
    | amount >= 20000 = amount + ((amount - 20000) * 0.05 + (15000 * 0.04) + (4000 * 0.02))
    | amount >= 5000 = amount + ((amount - 5000) * 0.04 + (4000 * 0.02))
    | amount >= 1000 = amount + ((amount - 1000) * 0.02)
    | otherwise = amount

interest' amount
    | amount >= 20000 = total + ((amount - 20000) * 0.05 + (15000 * 0.04) + (4000 * 0.02))
    | amount >= 5000 = total + ((amount - 5000) * 0.04 + (4000 * 0.02))
    | amount >= 1000 = total + ((amount - 1000) * 0.02)
    | otherwise = total
    where
        total = amount
