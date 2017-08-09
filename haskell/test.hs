go [] = Left "Nope"
go list = test list 0

goEfficient [] = Left "Nope"
goEfficient (x:xs) = efficientTest [] (x:xs) (0, sum (x:xs)) 0

test :: [Int] -> Int -> Either String Int
test list idx | idx < length list = case leftSum == rightSum of
                                      True -> Right (idx - 1)
                                      _ -> test list (succ idx)
              | otherwise = Left "DESASTER"
          where leftSum = sum (drop idx list)
                rightSum = sum (take idx list)

efficientTest :: (Num a, Enum a, Eq a) => [a] -> [a] -> (a, a) -> a -> Either String a
efficientTest x [] _ acc = Left "Nope"
efficientTest xs (y:ys) (sumX, sumY) idx | sumX + y == sumY - y = Right idx
                                         | otherwise = efficientTest (y:xs) ys (sumX + y, sumY - y) (succ idx)
