module SteamWorks where

   -- 1-es feladat
   newtype Natural = Nat Int
   -- 1. a)
   instance Show Natural where
      show (Nat a) = show a
   -- 1. b)
   instance Bounded Natural where
      minBound = Nat 0
      maxBound = Nat 32
   -- 1. c)
   instance Eq Natural where
      (Nat a) == (Nat b) = a == b
   instance Ord Natural where
      compare (Nat a) (Nat b) = compare a b

   -- 2-es feladat
   -- 2. a)
   -- Helper, hogy megkapjam a maxbound értékét
   fromNaturalToInt :: Natural -> Int
   fromNaturalToInt (Nat a) = a

   add, mul, pow :: Natural -> Natural -> Natural
   add (Nat a) (Nat b) = Nat ((a + b) `mod` fromNaturalToInt(maxBound::Natural))
   mul (Nat a) (Nat b) = Nat ((a * b) `mod` fromNaturalToInt(maxBound::Natural))
   pow (Nat a) (Nat b) = Nat ((a ^ b) `mod` fromNaturalToInt(maxBound::Natural))
   -- 2. b)
   addi, muli, powi :: Natural -> Int -> Natural
   addi n@(Nat a) b = Nat (fromNaturalToInt((add n (Nat b))) `mod` fromNaturalToInt(maxBound::Natural))
   muli n@(Nat a) b = Nat (fromNaturalToInt((mul n (Nat b))) `mod` fromNaturalToInt(maxBound::Natural))
   powi n@(Nat a) b = Nat (fromNaturalToInt((pow n (Nat b))) `mod` fromNaturalToInt(maxBound::Natural))
   -- 2. c)
   sum , prod :: [Natural] -> Natural
   sum [] = Nat 0
   sum ls = foldr (add) (Nat 0) ls
   prod [] = Nat 1
   prod ls = foldr (mul) (Nat 1) ls

   -- 3-as feladat
   data Log = And Bool
            | Or Bool
            | Imp Bool
            | Neg
   -- 3. a)
   instance Show Log where
      show (And a) = "And " ++ show a
      show (Or a) = "Or " ++ show a
      show (Imp a) = "Imp " ++ show a
      show (Neg) = "Neg"
   -- 3. b)
   instance Eq Log where
      (And a) == (And b) = a == b
      (Or a) == (Or b) = a == b
      (Imp a) == (Imp b) = a == b
      (Neg) == (Neg) = True
      _ == _  = False

   -- 4-es feladat
   execute :: Bool -> Log -> Bool
   execute b Neg = not b
   execute b (Or a) = or [a,b]
   execute b _ = b 

   -- 5-ös feladat
   normalize :: [Log] -> [Log]
   normalize [] = []
   normalize ((And a):xs) = Neg : Or (not a) : Neg : normalize xs
   normalize ((Imp a):xs) = Neg : Or a : normalize xs
   normalize (x:xs) = x : normalize xs  

   yes, could, excludes,chain :: [Bool] -> Bool
   yes [] = True
   yes (x:xs) = x && yes xs
   could [] = False
   could (x:xs) = x || could xs
   excludes [] = False
   excludes [a] = a
   excludes (True:False:xs) = excludes xs
   excludes _ = False
   chain [] = True
   chain [a] = False
   chain (b1:b2:xs) = b1 == b2 && chain xs

   run :: Bool -> [Log] -> Bool
   run b xs = foldl (\acc x -> execute acc x) b $ normalize xs



