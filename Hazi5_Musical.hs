module Musical where
    
    fixNotes = ['C', 'D', 'E', 'F', 'G', 'A', 'H']

    type Basis = Char
    type Note = (Basis , Int)
    type MusicSheet = String

    at :: {-fixNotes :: -} [Basis] -> Basis -> Int
    at [] c = -1
    at (x:xs) c = helper (x:xs) c 0
        where
            helper :: [Basis] -> Basis -> Int -> Int
            helper [] _ _ = -1
            helper (x:xs) c acc 
                | x == c = acc
            helper (x:xs) c acc = helper xs c (acc+1)

    toNotation :: [Note] -> MusicSheet
    toNotation [] = []
    toNotation ((note, num):xs)
                | num <= 50 = (flat note) ++ toNotation xs
                | num > 50 && num < 150 = [note,' '] ++ toNotation xs
                | num >= 150 = (sharp note) ++ toNotation xs
                    where
                        flat :: Basis -> String
                        flat n = n:'♭':' ':[]
                        sharp :: Basis -> String
                        sharp n = n:'#':' ':[]

    fromNotation :: MusicSheet -> [Note]
    fromNotation [] = []
    fromNotation [x] = [(x,100)]
    fromNotation (c1:c2:xs)
        | c1 == ' ' = fromNotation (c2:xs)
        | c2 == ' ' = (c1,100):fromNotation (xs)
        | c2 == '#' = (c1,150):fromNotation (xs)
        | c2 == '♭' = (c1,50):fromNotation (xs)

    distance :: {-fixNotes :: -} [Basis] -> Note -> Note -> Int
    distance bs (b1, num1) (b2, num2)
        | x > y = ((x - y)*(-1))*1000 + (abs(num1 - num2))
        | otherwise = ((x - y))*1000 + (abs(num1 - num2))
            where
                x = (at bs b1)
                y = (at bs b2)     
    sim :: Num a => [(String, String, a, MusicSheet)] -> (String, String)
    sim [] = ("","")
    sim a@((n, t, y, s):xs) = maxAcc (helper a []) [("", "", 20, "")]
        where
            helper :: Num a => [(String, String, a, MusicSheet)] -> [(String, String, a, MusicSheet)] -> [(String, String, a, MusicSheet)]
            helper [] acc = acc
            helper (l@(n, t, y, s):xs) acc
                | numOfSound s >= 20 = helper xs (l:acc)
                | numOfSound s < 20 = helper xs (acc)
            maxAcc :: Num a => [(String, String, a, MusicSheet)] -> [(String, String, a, MusicSheet)] -> (String, String)
            maxAcc [] ((n, t, y, s):ys) = (n, t)
            maxAcc ((n, t, y, s):xs) l@((n2, t2, y2, s2):ys)
                | numOfSound s > numOfSound s2 = maxAcc xs [(n, t, y, s)]
                | otherwise = maxAcc xs l
            numOfSound s = length (words s)
    
    harmony :: {-fixNotes :: -} [Basis] -> Note -> (Note, Note, Note)
    harmony l p@(n , m) | (at l n) >= 5 = (p , (l !! ((at l n) - 2) , m) , (l !! ((at l n) - 4) , m))
                    | (at l n) < 5 && (at l n) >= 3 = (p , (l !! ((at l n) + 2) , m) , (l !! ((at l n) - 2) , m) )
                    | otherwise = (p , (l !! ((at l n) + 2) , m) , (l !! ((at l n) + 4) , m) )
    
