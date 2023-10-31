{-# LANGUAGE NoImplicitPrelude #-}

module MiniBunti where

--- Ez alá a sor alá Zserbó engedélyével írhatsz, és pontosan azt, amit megengedett

import Prelude (Bool(True, False), Integral, (<=), (+), (*), div, mod, String, (&&), not)

--- E felé a sor felé Zserbó engedélyével írhatsz, és pontosan azt, amit megengedett
--- Ezek után jöjjön a megoldásod

toOctal :: Integral a => a -> [a]
toOctal a = helper [] a 
   where
      helper :: Integral a => [a] -> a -> [a]
      helper acc 0 = acc
      helper acc a = helper (mod a 8 : acc) (div a 8)

fromOctal :: Integral a => [a] -> a
fromOctal (x:xs) = helper (x:xs) 0
    where
        helper :: Integral a => [a] -> a -> a
        helper [] acc = acc
        helper (x:xs) acc = helper xs (x+acc*8)

octality:: Integral a => a -> [a]
octality a = helper (toOctal a) 0
   where 
      helper :: Integral a => [a] -> a -> [a]
      helper [] acc = toOctal acc
      helper (x:xs) acc = helper xs (acc + x)

sick :: Integral a => String -> ([] Bool) -> ([] a)
sick ('#':xs) givenB = reverse (compare 0 (concatBool (xs) True []) (givenB))
--sick ('#':xs) = concatBool (xs) True [] --> ez csak testingre van
   where
      compare :: Integral a => a -> ([] Bool) -> ([] Bool) -> ([] a)
      compare _ [] _ = []
      compare _ _ [] = []
      compare acc (b:bs) (c:cs)
         | (not b) && (not c) = compare (acc+1) bs cs
         | b && c = compare (acc+1) bs cs
         | True = acc:compare (acc+1) bs cs
      reverse l =  rev l []
            where
               rev []     a = a
               rev (x:xs) a = rev xs (x:a)  
      concatBool :: String -> Bool -> ([] Bool) -> ([] Bool)
      concatBool [] _ acc = normalize acc
            where
               normalize :: [Bool] -> [Bool]
               normalize (False:xs) = normalize xs
               normalize xs = xs
      concatBool (str:xs) b acc
         | b = concatBool xs b' (acc `test` res)
         | True = []
            where
               (b', res) = hexConvert ([str])
      test :: [Bool] -> [Bool] -> [Bool]
      test _ []  = []
      test a b = concat a b 
      concat []     ys = ys
      concat (x:xs) ys = x : xs `concat` ys
      hexConvert :: String -> (Bool, ([] Bool))
      hexConvert "F" = (True,[True, True, True, True])
      hexConvert "E" = (True,[True, True, True, False])
      hexConvert "D" = (True,[True, True, False, True])
      hexConvert "C" = (True,[True, True, False, False])
      hexConvert "B" = (True,[True, False, True, True])
      hexConvert "A" = (True,[True, False, True, False])
      hexConvert "9" = (True,[True, False, False, True])
      hexConvert "8" = (True,[True, False, False, False])
      hexConvert "7" = (True,[False, True, True, True])
      hexConvert "6" = (True,[False, True, True, False])
      hexConvert "5" = (True,[False, True, False, True])
      hexConvert "4" = (True,[False, True, False, False])
      hexConvert "3" = (True,[False, False, True, True])
      hexConvert "2" = (True,[False, False, True, False])
      hexConvert "1" = (True,[False, False, False, True])
      hexConvert "0" = (True,[False, False, False, False]) 
      hexConvert xs = (False,[])

sick _ _ = []
--sick _ = [] ez csak testingre van

-- Egy olyan fügvény kell, ami vissza adja a listát ameddig az első eleme true
-- Ha viszont false akkor kitörli a false-ot