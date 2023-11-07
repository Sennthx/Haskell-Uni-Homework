module Manufacture where

   import Data.Char

   data Rune = Fehu
             | Ansuz
             | Kaunan
             | Hagalaz
             | Naudiz
             | Berkanan
            deriving(Eq)

   data Element = Aqua
                | Ignis
                | Aer
                | Terra
                | Lux
                | Noctum
               deriving(Eq)
   
   toName :: Rune -> String
   toName (Fehu) = "Fehu"
   toName (Ansuz) = "Ansuz"
   toName (Kaunan) = "Kaunan"
   toName (Hagalaz) = "Hagalaz"
   toName (Naudiz) = "Naudiz"
   toName (Berkanan) = "Berkanan"

   toEnglish ::  Element -> String
   toEnglish (Aqua) = "Water"
   toEnglish (Ignis) = "Fire"
   toEnglish (Aer) = "Air"
   toEnglish (Terra) = "Earth"
   toEnglish (Lux) = "Light"
   toEnglish (Noctum) = "Darkness"

   newtype HumanMagic a = Enchant (a, [(Element, Integer)])

   vowels :: String
   vowels = "AEIOUaeiou"
   consonLettersWithSpaceAndTab :: String
   consonLettersWithSpaceAndTab = "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz"

   -- Első feladat első helper
   instances :: String -> Char -> Integer -> (String, Integer)
   instances [] c num = ("", num)
   instances str@(s:rest) c num
      | s == c = instances rest c (num+1)
      | s /= c = (str, num)
   -- Első feladat második helper az elem függvény helyett
   contains :: Char -> String -> Bool
   contains c [] = False
   contains c (x:xs) = c == x || contains c xs 
   
   consonants :: String -> [(Char, Integer)]
   consonants str = compress (instances) $ words $ conson (contains) str []
      where
         conson :: (Char -> String -> Bool) -> String -> String -> String
         conson f1 [] acc = acc
         conson f1 (s:rest) acc
            | f1 s vowels = conson f1 rest acc
            | not $ f1 s consonLettersWithSpaceAndTab = conson f1 rest acc
            | otherwise = conson f1 rest (acc ++ s:[])
         compress :: (String -> Char -> Integer -> (String, Integer)) -> [String] -> [(Char, Integer)]
         compress f2 [] = []
         compress f2 arr@(x:xs) = (helper x) ++ compress f2 xs
            where
               helper :: String -> [(Char, Integer)]
               helper [] = []
               helper str@(c:rest) = (c, snd $ f2 rest c 1) : helper (fst $ f2 rest c 1)


   decompile :: [(a, Integer)] -> [a]
   decompile [] = []
   decompile (x:rest) = getChars x ++ decompile rest
      where
         getChars :: (a, Integer) -> [a]
         getChars (a, 0) = []
         getChars (c,num) = c : getChars (c,num-1)


   rune :: (String -> (String, [(Rune, Integer)])) -> String -> [Rune]
   rune f1 [] = []
   rune f1 str = getAllRunes (f1 str) ++ rune f1 (getRest $ f1 str)
      where
         getRest :: (String, [(Rune, Integer)]) -> String
         getRest (rest, arr) = rest
         getAllRunes :: (String, [(Rune, Integer)]) -> [Rune]
         getAllRunes (str, []) = []
         getAllRunes (str, (r,num):xs) = getNumOfRunes (r, num) ++ getAllRunes (str, xs)
            where
               getNumOfRunes :: (Rune, Integer) -> [Rune]
               getNumOfRunes (r, 0) = []
               getNumOfRunes (r, num) = r : getNumOfRunes (r, num-1)

   -- Tesztelő függvények
   scrible :: [(Char, [Element])]
   scrible = [('b', [Aqua, Ignis]), ('c',[Terra, Aer]), ('d', [Lux, Noctum]), ('f', [Ignis, Aer]), ('g', [Terra, Lux]), ('h',[Noctum, Aqua]), ('j', [Aqua,Aer]), ('k', [Terra, Noctum]), ('l', [Lux, Ignis]), ('m', [Aer, Noctum]), ('n',[Terra, Aqua]), ('p', [Aqua,Lux]), ('q',[Ignis, Noctum]), ('r', [Aer, Aqua]), ('s',[Terra,Ignis]), ('t', [Noctum, Noctum]), ('v', [Lux, Lux]), ('w', [Terra, Terra]), ('x', [Aer, Aer]), ('y', [Ignis, Ignis]), ('z', [Aqua, Aqua])]

   scripture :: Char -> Rune
   scripture c
      | m == 0 = Berkanan
      | m == 1 = Naudiz
      | m == 2 = Hagalaz
      | m == 3 = Kaunan
      | m == 4 = Ansuz
      | m == 5 = Fehu
         where
               m = Data.Char.ord c `mod` 6
      