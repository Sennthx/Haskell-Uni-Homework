# 7. Házifeladat

## 0. Modul név, típus szinonímák és előfeltételek

> Mostmár egyre több koncepcióval, és függvénnyel ismerkedünk meg. Így továbbra is erősen tudom ajánlani a [hoogle](http://lambda.inf.elte.hu/haskell/hoogle/)-t

Hozzunk létre egy modult `Manufacture` néven!

Illetve adottak a függvények, amik a teszteléshez szükségesek:

```haskell

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

```

## 1. Várj, van másik?!

Hozzuk létre a `Rune` adat struktúrát a következő konstrultorokkal:

|    Név   |
|:--------:|
| Fehu     |
| Ansuz    |
| Kaunan   |
| Hagalaz  |
| Naudiz   |
| Berkanan |

Továbbá az előző házi feladatból jól ismert `Element` adat struktúrát az alábbi konstruktorokkal:

|    Név   |
|:--------:|
| Aqua     |
| Ignis    |
| Aer      |
| Terra    |
| Lux      |
| Noctum   |

Az egyzerűséf végett az utolsó konstruktorok után bigyesszük oda a `deriving Eq` kifejezést!

Példa rá:

```haskell

data Later = Future
    deriving Eq

```

### a) Szövegelésből sosem elég

Készítsük el a `toEnglish :: Element -> String` és a `toName :: Rune -> String` függvényeket, amik a megfelelő paraméterek esetén kiírják a konstruktorok neveit! Az implementáció teljesen rátok van bízva.

### b) Szövegeket róni, rúnákat vésni.

Hoz létre `newtype` kulcsszóval a `HumanMagic` típust, ami a következő kifejezést csomagolsja be: `a -> (a, [(Element, Integer)])`. A konstruktor neve `Enchant` legyen!

## 2. Mágikus pecsét, szimbólumok... Oh jaj!

Valósítsuk meg a `consonants :: String -> [(Char, Integer)]` függvényt, ami kompresszálja a megadott szöveget az alábbi módon:

```plaintext

"kopp" -> [('k', 1), ('o', 1), ('p', 2)]
"kopogtat" -> [('k', 1),('o', 1),('p', 1),('o', 1),('g', 1),('t', 1),('a', 1),('t', 1)]

```

Ezen felül kiszűri az így keletkezett listából az összes magánhangzót, vagyis:

```plaintext

"kopp" -> [('k', 1), ('p', 2)]
"kopogtat" -> [('k', 1),('p', 1),('g', 1),('t', 1),('t', 1)]

```

Ügyeljünk arra, hogy nem feltétlen csak angol betűket kaphatunk! Ilyenkor ezeket minden esetben ignorálni kell!

A függvény megvalósításakor használj minimum kettő magasabb rendű függvényt!

## 3. Visszafordítani már nem lehet...

Hozzuk létre, és implementáljuk a `decompile :: [(a, Integer)] -> [a]` típus szignatúrájú függvényt!

ennek a feladata, rendezett párok listájából állítson elő szöveget:

```plaintext

[('k', 1),('p', 1),('g', 1),('t', 1),('t', 1)] -> "kpgtt"
[('k', 1), ('o', 1), ('p', 2)] -> "kopp"

```

A függvény legyen totális, vagyis ne legyen olyan bemenet, amire nem illezskedik minta!

## 4. Törp mestermunka

Implementáljuk a következő függvényt: `rune :: (String -> (String, [(Rune, Integer)])) -> String -> [Rune]`

A függvény feladata, hogy rekurzívan állítsa elő a rúnákat a paraméterül kapott függvény segítségével!

## 5. Az emberi "kreativítás".

Készítsük el az alábbi függvényt: `sigil :: HumanMagic String -> String -> [Element]`

A feladat, hogy a megkapott paraméterek segítségével, rekurzívan állítsuk elő az elementális listát!

## 6. Használati útmutató: nincs!

Adott a `spellCast :: (Rune -> Rune -> Bool) -> [Rune] -> ([Rune], [Rune])` típus szignatúra.

A függvény a paraméterűl kapott függvény, és a listában lévő két elem segítségével válogatja szét a listában lévő elemeket.

Ha a függvény igazt ad vissza, akkor a kettős első eleméhez fűzzük hozzá, ha hamis, akkor a kettős második eleméhez fűzzük hozzá a lista első elemét.

Ha a listánk egy elemet tartalmaz, akkor annak eleme a rendezett pár első tagjához legyen hozzáfűzve!

A listából egyszerre csak egy elemet hagyunk el! Továbbá a feladat megoldásához rekurziót használj!

## Bónusz: Darabolva

Készítsük el az előző házifeladat bónusz feladatából ismert `SplitOn` függvény magasabb rendű változatát! Vagyis ne egy adott elem mentén darabolja fel a listát, hanem egy adott predikátum segítségével!

## Tesztek

```haskell

consonants ['A'..'z'] == [('B',1),('C',1),('D',1),('F',1),('G',1),('H',1),('J',1),('K',1),('L',1),('M',1),('N',1),('P',1),('Q',1),('R',1),('S',1),('T',1),('W',1),('X',1),('Y',1),('Z',1),('b',1),('c',1),('d',1),('f',1),('g',1),('h',1),('j',1),('k',1),('l',1),('m',1),('n',1),('p',1),('q',1),('r',1),('s',1),('t',1),('w',1),('x',1),('y',1),('z',1)]
consonants "rögtönzött mondattani kifejezés" == [('r',1),('g',1),('t',1),('n',1),('z',1),('t',2),('m',1),('n',1),('d',1),('t',2),('n',1),('k',1),('f',1),('j',1),('z',1),('s',1)]
null $ consonants $ replicate 1000 'a'
consonants "katttt" == [('k',1),('t',4)]
decompile (consonants "katttt") == "ktttt"
null $ decompile $ consonants $ replicate 1000 'a'
("rgtnzttmndttnkfjzs" ==) $ decompile $ consonants "rögtönzött mondattani kifejezés"
rune (\x -> case x of [] -> ([],[]); (f:s) -> (s,[(scripture f, 1)]);) "Katt" == [Kaunan,Naudiz,Hagalaz,Hagalaz]
null $ rune undefined []
length (rune (\x -> case x of [] -> ([],[]); (f:s) ->(s, [(Berkanan, 3) | _ <- [1..(ord f)]])) "rögtönzött mondattani kifejezés") == 11286
null $ sigil undefined []
null $ sigil (Enchant $ \x -> case x of [] -> ([],[]); (f:s) -> (,) s $ map (, 1) $ maybe [] id $ lookup f scrible;) (replicate 1000 'a')
not $ null $ sigil (Enchant $ \x -> case x of [] -> ([],[]); (f:s) -> (,) s $ map (, 1) $ maybe [] id $ lookup f scrible;) "katt"
null $ snd $ spellCast (\_ _ -> True) $ replicate 100 Hagalaz
1 ==) $ length $ fst $ spellCast (\_ _ -> False) $ replicate 100 Hagalaz
let (fs , sn) = spellCast (\ x y -> toName x == toName y) [] in length fs == length sn
let (fs , sn) = spellCast (\ x y -> toName x == toName y) [Berkanan, Kaunan, Kaunan, Berkanan, Berkanan, Kaunan, Kaunan, Berkanan] in length fs == length sn

```