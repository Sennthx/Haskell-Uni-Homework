module Race where
   -- név, rajtszám, seprű modell, futamidő, kedvenc szín
   data Mage = Participant String Int String Double String

   instance Show Mage where
      show (Participant n rsz sm fi ksz) = "My name is: " ++ n ++ ". I had the start number of " ++ show rsz ++ " and I had " ++ show fi ++ "s as finish time. My broom is a " ++ sm ++ "." 

   getTime :: Mage -> Double
   getTime (Participant n rsz sm fi ksz) = fi
   getStart :: Mage -> Int
   getStart (Participant n rsz sm fi ksz) = rsz

   largestAndFastest :: [Mage] -> Maybe Mage
   largestAndFastest mages = preCheck (getfastMages mages)
      where
         preCheck :: [Mage] -> Maybe Mage
         preCheck fastMages
            | null (fastMages) = Nothing
            | otherwise = largestStartNum fastMages (head fastMages)
         getfastMages :: [Mage] -> [Mage]
         getfastMages [] = []
         getfastMages (x:xs)
            | getTime(x) <= 97 = x: getfastMages xs
            | otherwise = getfastMages xs
         largestStartNum :: [Mage] -> Mage -> Maybe Mage
         largestStartNum [] acc = Just acc
         largestStartNum (x:xs) acc
            | getStart x > getStart acc = largestStartNum xs x
            | otherwise = largestStartNum xs acc