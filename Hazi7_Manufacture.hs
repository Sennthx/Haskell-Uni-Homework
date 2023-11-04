module Manufacture where

   import Data.Char

   data Rune = Fehu
             | Ansuz
             | Kaunan
             | Hagalaz
             | Naudiz
             | Berkanan
            deriving(Eq,Show)

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

   

   -- Megfogom a stringet és kiveszem belőle a vowel betűket
   -- Ha nem angol ABC akkor don't care
   -- Kivétel után megszámolom mennyi van az adott betűből és kompresszálom

   vowels :: String
   vowels = "AEIOUaeiou"
   consonLettersWithSpaceAndTab :: String
   consonLettersWithSpaceAndTab = "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz \t"

   consonants :: String -> [(Char, Integer)]
   consonants str = compress instances (words (conson elem str []))
      where
         conson :: (Char -> String -> Bool) -> String -> String -> String
         conson f1 [] acc = acc
         conson f1 (s:rest) acc
            | f1 s vowels = conson f1 rest acc
            | not(f1 s consonLettersWithSpaceAndTab) = conson f1 rest acc
            | otherwise = conson f1 rest (acc ++ [s])
         instances :: String -> Char -> Integer
         instances [] c = 0
         instances str@(s:rest) c
            | s == c = 1 + (instances rest c)
            | s /= c = 0 + (instances rest c)
         compress :: (String -> Char -> Integer) -> [String] -> [(Char, Integer)]
         compress f1 [] = []
         compress f1 arr@(x:xs) = (helper x) ++ compress f1 [s | s <- arr, s /= x]
            where
               helper :: String -> [(Char, Integer)]
               helper [] = []
               helper str@(c:rest) = (c, instances str c) : helper [z | z <- str, z /= c]
         -- Javított teszteset

         -- consonants ['A'..'z'] == [('B',1),('C',1),('D',1),('F',1),('G',1),('H',1),('J',1),('K',1),('L',1),('M',1),('N',1),('P',1),('Q',1),('R',1),('S',1),('T',1),('V',1),('W',1),('X',1),('Y',1),('Z',1),('b',1),('c',1),('d',1),('f',1),('g',1),('h',1),('j',1),('k',1),('l',1),('m',1),('n',1),('p',1),('q',1),('r',1),('s',1),('t',1),('v',1),('w',1),('x',1),('y',1),('z',1)]

         -- consonants "rögtönzött mondattani kifejezés" == [('r',1),('g',1),('t',3),('n',1),('z',1),('m',1),('n',2),('d',1),('t',2),('k',1),('f',1),('j',1),('z',1),('s',1)]

   decompile :: [(a, Integer)] -> [a]
   decompile [] = []
   decompile (x:rest) = (getChars x) ++ (decompile rest)
      where
         getChars :: (a, Integer) -> [a]
         getChars (a, 0) = []
         getChars (c,num) = c : getChars (c,num-1)
         -- Javított teszteset

         -- ("rgtttnzmnndttkfjzs" ==) $ decompile $ consonants "rögtönzött mondattani kifejezés"

   rune :: (String -> (String, [(Rune, Integer)])) -> String -> [Rune]
   rune f1 [] = []
   rune f1 str = getAllRunes (f1 str) ++ (rune f1 (getRest ((f1 str))))
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

   {-asd x = case x of [] -> ([],[])
   (\x -> case x of [] -> ([],[]); (f:s) -> (s,[(scripture f, 1)]);)  -}

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
      