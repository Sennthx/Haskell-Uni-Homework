module Fozetek where

type Osszetevo = (Integer, String)
type Osszetevok = [Osszetevo]
type Recept = Osszetevok

ujratolt :: Osszetevok -> Integer -> Osszetevok
ujratolt xs maxVal = [(x, nev) | (x, nev) <- xs, x >= maxVal]
-- Uh ez nagyon menő így

egyszeru :: Recept -> Bool
-- Ez is működik de el fog vinni az inkvizíció :D
-- egyszeru ((x,name):rest) = length ((x,name):rest) == 1 
egyszeru [_] = True
egyszeru _ = False

kedvenc :: Recept -> Bool
-- Végtelen lista go brrrrrr
--kedvenc ((x,name):rest) = length ((x,name):rest) >= 4
kedvenc [_, _] = True
kedvenc (_ : _ : _ : _ :rest) = True
kedvenc _ = False -- Ez a lyukas téma elég menő

tarisznya ::  Osszetevok ->  Osszetevok
-- Szeretem a lyukakat
tarisznya [_] = []
tarisznya [_, _] = []
tarisznya xs = xs

pixi :: Osszetevok ->  Osszetevok
pixi (x:y:_:rest) = x:y:rest
pixi xs = xs

konyv :: [Recept] -> [Recept]
konyv xs = [[(x, nev)] | [(x, nev)] <- xs]
-- Megint lerövidítve sokkal szebb

zizi :: (Integral a , Integral b) => a -> b -> Int
zizi x y = fromIntegral x + fromIntegral y 



