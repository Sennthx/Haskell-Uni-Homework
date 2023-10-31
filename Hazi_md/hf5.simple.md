# 5. Házifeladat

Mosstmár használhatóak az őrfeltételek, elágazások, így pár apróbb dolgot tisztáznunk kell:

 - Ha egy függvény visszatérési értéke `Bool`, akkor tljesen felesleges az őrfeltétel, így használni őket tilos ebben az esetben.

 - Egy `Bool` típusú érték egyenlőség viszgálata teljesen felesleges. A `2 < 1 == True` ugyanazt valósítja meg, mint a `2 < 1` kiffejezés. Redundáns, és csak zajt ad a kódhoz.

 - `if ... then ... else` kifejezés továbbra is tíltott!


Továbbá a listákhoz fűződően van 1-2 dolog, amit meg kell  említenem:

 - Haskellben az alapértelmezett lista érték a végtelen lista, ezért ha nincs valamilyen módon kiemelve, esetleg a történetből következően logikusan következtethető (ha valaki talált végtelen tárhelyű raktárak, kérlek szóljon, nem férnek el lassan a teáim), akkor a függvénynek végtelen listára is működnie kell!

 - Ha a lista generátorban nem csinálunk semmit az elemmel, és nincsen feltételünk, akkor a generátor teljesen felesleges! a `[c | c <- xs]` kifejezés ugyanaz, mint az `xs`, csak erőforrást pazarlunk vele, és zajt adunk a kódhoz.

 - Tessék használni a megkötő (`@`) operátort a mintaillesztésnél, ahol van értelme!

 - Ha mintát illesztünk a lista fejelemére, vagyis, hogy minimum egy elemű listánk van (`x : xs`), akkor tessék használni a mintaillesztett elemet, ben pedig a `head (x : xs)` hívást használni! Ismét, erőforrást pazarlunk vele, és zajt adunk a kódunkhoz.


Remélhetőleg mindent összeszedtem. Ezek az irányelvek nem csak funkcionális programozásnál tudnak segítséget nyújtani, hanem más nyelvek esetén is, pl `python`, sokkal olvashatóbb kódot kapunk.

## 0. Modul név, típus szinonímák és előfeltételek

Hozzunk létre egy modult `Musical` néven!

ahol a `fixNotes` paraméter nevet látjuk, oda 90% eséllyel a következő lista fog kerülni: `['C', 'D', 'E', 'F', 'G', 'A', 'H']`.

Hozzuk létre a következő szinonímákat:

```haskell
type Basis = Char

type Note = (Basis , Int)

type MusicSheet = String
```

## 1. Botfülű, aki nem tudja

Készítsünk egy függvényt az alábbi szignatúrával:

```haskell
at :: {-fixNotes :: -} [Basis] -> Basis -> Int
```

Ez a függvény visszaadja a megadott hangnak, vagyis paraméterének az indexét a listában. Amennyiben nics benn ilyen hang, adjunk vissza `-1`-et!
## 2. Zenészek titkosírása

Mint tudjuk, a zenészek nem így szokták megadni a különböző dalaikat. Most az interneten fellelhető gitár jelölésekhez igazodva fogjuk a nótákat kiírni.
### a) Mert kottát olvasni ki tud?
  
Készítsük el a következő függvényt az alábbi szignatúrával:

```haskell
toNotation :: [Note] -> MusicSheet
```

Ez a függvény átalakítja az általunk használt adat orientált jelölést egy általános jelöléssé az alábbi módon:

```plaintext
[('F', 100)] -> "F"

[('F', 150)] -> "F#"

[('F', 50 )] -> "F♭"

[('F', 130)] -> "F"

[('F', 185)] -> "F#"

[('F', 76 )] -> "F"

[('F', 20 )] -> "F♭"

[('G', 50 ), ('E', 100)] -> "G♭ E"

                               ^

                        A szoközre itt ügyelj!
```

Tehát összesítve:

```plaintext
<= 50         -> Flat (♭)

> 50, < 150   -> Normal

>= 150        -> Sharp (#)
```

Megoldáskor használj rekurziót!
### b) "Für Elise-ni tílos!" áll a táblán

Hozzuk létre a következő függvényt ezzel a típus szignatúrával:

```haskell
fromNotation :: MusicSheet -> [Note]
```

Ez a függvény szándékozik az előbb említett módon a szövegből vissza alakítani az adat orientált jelölésünkké a hangokat.

Megoldáskor használj rekurziót!
## 3. Nagy tercet kértem! NAGYOT!

Adott az alábbi szignatúra:

```haskell
distance :: {-fixNotes :: -} [Basis] -> Note -> Note -> Int
```

A függvény célja, hogy megadja két hang közötti távolságot! A listánkban szereplő hangok távolsága minden esetben 1000!

Példa : `distance fixNotes ('F', 100) ('F', 150) == 50`; `distance fixNotes ('G', 50) ('F', 100) == -950`

## 4. Ez ám a szinfónia!

Legyen egy `sim` függvényünk, ami rendezett négyesek listáját várja. A négyesek első tagja a zeneszerző neve, második tagja a darab címe, harmadik tagja a kiadás dátuma, negyedik tagja pedig a hangok listája, online jelölési formában.

Adjuk meg azt a zeneszerő-darab cím kettőst, amiben a legtöbb hang van, de minimum 20 darab!

*Figyelj:* Az évszámokat nem feltétlen csak egész számokként kaphatod meg!
## 5. A 6 királynő probléma

Adott a következő függvény szignatúra:

```haskell
harmony :: {-fixNotes :: -} [Basis] -> Note -> (Note, Note, Note)
```

A függvény viszzatérési értéke egy hármas, aminek első tagja a megkapott paraméter, második tagja az a hang, ami pontosan 2000 távolságra van, a harmadik tag pedig az a hang, ami 4000 távolságra van a bemeneti paramétertől. Ha nem tudunk 4000 távolságra adni hangot, akkor adjunk meg egy másik hangot, ami 2000 távolságra van, és nem egyezik meg az első hanggal!
## Bónusz feladat: Taylor Swift sor

Definiáld a `cipher` függvényt, amely egy titkosított szövegből kinyeri az első olyan kettő hosszú karaktersort, amelyet számjegy követ. Ha nincs ilyen, akkor az eredmény legyen üres String. A megoldásban használj mintaillesztést és rekurziót! `take`, `drop`, `length` és általánosabb variánsaik teljesen feleslegesek, épp ezért nem használhatóak!

Segítség: Az egyes karakterek azonosításához használjuk a Data.Char függvényeit. Hogy melyiket? Azt kell nektek megtalálni.

```haskell
cipher "PYdg7iT4vdO0n4AgmGfUpRzogAf" == "dg"

cipher "PYdgaiTLvdOKnAAgmGfUpRzogA4" == "gA"

cipher "4vkYyAO174midQTt0" == "AO"

cipher "BwxwEwqCKHuMTAaPn" == ""

cipher ['\0'..] == "./"

cipher "dM7" == "dM"

cipher "777" == "77"

cipher "Kmz" == ""

cipher "Zk"  == ""

cipher "T4"  == ""

cipher "" == ""
```

## Tesztek

```haskell  
at [] '5' == -1

at fixNotes 'L' == - 1

at ['A'..] 'Q' == 16

at fixNotes 'A' == 5

take 51 (drop 100 (toNotation [('G', (x `mod` 20) * 10)| x <- [0..]])) == "# G\9837 G\9837 G\9837 G\9837 G\9837 G\9837 G G G G G G G G G G# G# G# G# G"

take 11 (drop 110 (fromNotation (cycle "G# G G\9837 "))) == [('G',50),('G',150),('G',100),('G',50),('G',150),('G',100),('G',50),('G',150),('G',100),('G',50),('G',150)]

distance fixNotes ('F', 100) ('F', 150) == 50

distance fixNotes ('G', 50) ('F', 100) == -950

distance ['A'..] ('A', 28500) ('z', (-28500)) == 0

distance fixNotes ('C', 100) ('C', 1000) == 0

harmony ['C'..] ('\1900', 50) == (('\1900',50),('\1898',1831050),('\1896',1829050))

harmony fixNotes ('C', 130) == (('C',130),('E',130),('G',130))

harmony fixNotes ('F', 175) == (('F',175),('A',175),('D',175))

harmony fixNotes ('A', 30) == (('A',30),('F',30),('D',30))

sim [] == ("","")

sim [("Zserbó", "Lucky Number", (10 :: Int), "F F F F F F F F F F F F F# F F F F F F F F F F ")] == ("Zserbó", "Lucky Number")

sim [("Zserbó", "Lucky Number", (10 :: Integer), "F F F F F F F F F F F F F# F F F F F F F F F F ")] == ("Zserbó", "Lucky Number")

sim [("Zserbó", "Lucky Number", (10 :: Double), "F F F F F F F F F F F F F# F F F F F F F F F F ")] == ("Zserbó", "Lucky Number")

sim [("Zserbó", "Lucky Number", (10 :: Float), "F F F F F F F F F F F F F# F F F F F F F F F F ")] == ("Zserbó", "Lucky Number")

sim [("Traktor", "Not Gonna work", (10 :: Double), "G")] == ("","")

sim [("Népdal", "Boci Boci Tarka", (1 `div` 0), "C E C E G G C E C E G G C H A G F A G F E D C C"), ("Nagy valószínűséggel a XVIII. században élt boconádi plébános", "Mennyből az angyal", 18000, "F F E F C A A G A F A D C A D C C C D C A H H C H G A G F  A G F")] == ("Nagy valószínűséggel a XVIII. században élt boconádi plébános","Mennyből az angyal") 
```