module Szolgalat where

   type Pile = String

   stockpile :: Int -> Pile
   stockpile 0 = "";
   stockpile x = stockpile (x-1) ++ ['\n' | x /= 1] ++ ['#' | x <- [1..x]] 

   type Package c d = (c , d)
   pack :: [a] -> [b] -> [Package a b]
   pack [] _ = []
   pack _ [] = []
   pack (x:xs) (y:ys) = (x,y) : pack xs ys

   type Ingredient = String
   storage ::[Ingredient] -> [(Int, Ingredient)]
   storage [] = []
   storage (x:xs) = (length [y | y <-xs, y == x]+1, x) : storage [y | y <-xs, y /= x]

   type Statement = [Bool]
   type Verdict = Bool
   notALie :: Statement -> Verdict
   notALie [] = True
   notALie (x:xs) = x && notALie xs
   
   findersKeepers :: Statement -> Verdict
   findersKeepers [] = False
   findersKeepers ( True : _ ) = True
   findersKeepers ( k : v ) = findersKeepers v
   --findersKeepers = or -- Ez miért működik???????????? ötletem sincs

   inquisition :: [String] -> [String] -> Verdict
   inquisition [] _ = False
   inquisition (x:xs) test@(y:ys) = not(null [asd | asd <- test, z <- words asd, z == x]) || inquisition xs test
   
   longerThan :: Int -> [a] -> Verdict
   longerThan y [] = y < 0
   longerThan 0 (_:xs) = True
   longerThan y (x:xs) = y < 0 || longerThan (y-1) xs

   spamFilter :: String -> Verdict
   spamFilter str = 3000 `longerThan` str || not (null [sor | sor <- lines str, 15 `longerThan` words sor])
   
   merge :: [a] -> [a] -> [a]
   merge [] ys = ys
   merge xs [] = xs
   merge (x:xs) (y:ys) = x:y : merge xs ys