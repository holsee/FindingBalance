x = [1..100000] ++ [100000,99999..1]

go [] = Left "Nope"
go list = test list 0

goEfficient [] = Left "Nope"
goEfficient (x:xs) = efficientTest [] (x:xs) (0, sum (x:xs)) 0

test :: [Int] -> Int -> Either String Int
test list index | index < length list = case leftSum == rightSum of
                                          True -> Right (index - 1)
                                          _ -> test list (succ index)
                | otherwise = Left "DESASTER"
          where leftSum = sum (drop index list)
                rightSum = sum (take index list)

efficientTest :: (Num a, Enum a, Eq a) => [a] -> [a] -> (a, a) -> a -> Either String a
efficientTest x [] _ acc = Left "Nope"
efficientTest xs (y:ys) (sumX, sumY) index | sumX + y == sumY - y = Right index
                                           | otherwise = efficientTest (y:xs) ys (sumX + y, sumY - y) (succ index)
