# 6. Házifeladat

## 0. Modul név, típus szinonímák és előfeltételek

Hozzunk létre egy modult `Pharmacy` néven!

Hozzuk létre a következő adat struktúrákat:

```haskell

newtype Ingredient = Ingredient [(Element, Effect)]

data Potion = Bottle
            | Potion Int Element Effect Potion

```

Ha most töltenénk be a fájlt, errort fog adni!

## 1. Főzetek világa

### a) Főzetek típusa

Hozzunk létre egy adat típust `Element` néven!
Ennek a típusnak a konstruktorai fogják jelölni a különböző természeti elemeket.

A konstruktorok neve, majd a jelentése az alábbi tálázatban olvasható:

|  Név  |     Jelentés      |
|:-----:|:-----------------:|
| Aqua  |  Víz/Water        |
| Ignis |  Tűz/Fire         |
|  Aer  | Levegő/Air        |
| Terra | Föld/Earth        |
|  Lux  | Fény/Light        |
|Noctum | Sötétség/Darkness |

### b) Főzetek hatása

Hozzunk létre egy adat típust `Effect` néven!
Ennek a típusnak a konstruktorai fogják jelölni a főzetek hatásait.

A konstruktorok neve, majd a jelentése az alábbi tálázatban olvasható:

|    Név   |     Jelentés      |
|:--------:|:-----------------:|
|Resistance|    Ellenállás     |
|  Boost   |     Erősítés      |
|  Damage  |      Sebzés       |
|  Debuf   |    Gyengítés      |

## 1. Cimkézés

### a) Mert egy nyelven nem elég...

készítsük el a `toEnglish` nevezetű függvényt az alábbi szignatúrával

```haskell

toEnglish ::  Element -> String

```

Ennek a függvények a feladata, hogy az elemeket átalakítsa angol szöveges formára. Az angol megfelelője egy elemnek a per jel után olvasható a táblázat megfelelő sorában.

### b) Persze, hogy titkosírásban!

készítsük el a `toPhrase` nevezetű függvényt az alábbi szignatúrával

```haskell

toPhrase :: Effect -> String

```

Ennek a függvények a feladata, hogy az elemeket átalakítsa szöveges formára úgy, hogy a konstruktor nevét írja ki.

## 2. Lefőzés, vagy elfőzés?

Alkossuk meg a `refine` névre hallgató függvényt az alábbi módon:

```haskell

refine :: (Element, Effect) -> Potion -> Potion

```

Ez a függvény egy eddigi főzethez add hozzá egy új elementális hatást (elem és hatás rendezett pár).

Amire ügyelni kell: ha már van egy pontosan ilyen elementális hatás, akkor a főzetben azt kell módosítani! Ha nincs, akkor adjunk hozzá egyet.

Minden módosítás 50-et ad az elementális hatás erejéhez (a `Potion` konstruktor első paramétere).

Ha a főzet összereje meghaladja az `1000`-t, akkor normalizálnunk kell! A normalizálás lefelé kerekítve történik, a tú lépés mértékével arányosan! Matematikusan megfogalmazva: $ \Large{\lfloor}\small aktualis\_ertek \times \frac{1000}{\sum{fozet\_ero}} \Large\rfloor $

Ha a főzet összereje nem haladja meg az `1000`-t, akkor nem szabad normalizálni!

## 3. Már forr is az üst!

Valósítsuk meg az alábbi függvényt!

```haskell

brew :: Ingredient -> Potion -> Potion

```

Ennek a függvénynek a segítségével egy összetevő minden hatását bele tudjuk főzni a megadott főzetbe.

## 4. Címkézés, címkézés...

Implementáljuk a következő függvényt:

```haskell

nameOf :: Potion -> String

```

Üres üveg (`Bottle`) paraméter esetén adjon vissza `"Bottl"` értéket. Minden más esetben `"Potion of <element_name> <effect_name>"` formában adja vissza, ahol az `<element_name>` a természeti elem angol nevét, az `<effect_name>` a hatás szövegbeli megjelenítését jelenti.

Példa : `"Potion of Light Damage"`

## 5. Gyógyszerész a pácban.

Adott az alábbi függvény

```haskell

pharmacy :: [Ingredient] -> String
pharmacy ls = named (brewOn ls Bottle) where
    brewOn :: [Ingredient] -> Potion -> Potion
    brewOn [] acc = acc
    brewOn (ingredient:ingredients) p = brewOn ingredients (brew ingredient p)
    named :: Potion -> String
    named b@(
            Potion _ Aqua Resistance (
            Potion a Aer Boost (
            Potion n Noctum Damage
            Bottle
        )))| n - a == 100 
             && nameOf b == "Potion of Water Resistance" = "Cold brew"
    named (
            Potion f Ignis Damage (
            Potion l Lux Damage (
            Potion e Terra Boost (
            Potion ed Terra Damage (
            Potion i Ignis Resistance 
            Bottle
        ))))) | abs (i - f) <= 187 
                && f + l + ed > 300
                && e + i >= 400 = "Dwarven spirit"
    named (
            Potion nd Noctum Debuf (
            Potion nr Noctum Resistance (
            Potion _ Ignis Debuf (
            Potion l Lux Boost (
            Potion t Terra Boost (
            Potion a Aer Boost
            Bottle
        )))))) | nd == nr 
                 && (l * t * a) `div` 10000 == 864 = "Astra's favourite"
    named (
            Potion n Noctum Damage (
            Potion l Lux Damage (
            Potion i Ignis Damage (
            Potion t Terra Damage (
            Potion a Aqua Damage (
            Potion ae Aer Boost
            Bottle
        )))))) | n + l + i + t + a + ae == 1000 = "Spicy tonic"

```

Illetve adottak a következő hozzávalók:

```haskell



```

Ezeknek a segítségével definiáljuk a `potion1`, `potion2`, `potion3`, `potion4` konstans függvényeket, amiket ha megadok a `pharmacy` függvénynek, rendre megadja ezeknek a főzeteknek a nevét!

## Bónusz: Darabokra esve

Definiáld a `splitOn :: Eq a => a -> [a] -> [[a]]` függvényt, amely egy adott elem mentén felbontja a listát.

Néhány eset hozzá:

```haskell

splitOn 'A' "ÉnAelmentemAaAvásárbaAfélApénzzel!" == ["Én","elmentem","a","vásárba","fél","pénzzel!"]
splitOn 1 [1] == [[],[]]
splitOn 1 [] == [[]]
splitOn "a" [] == [[]]
(take 50 $ splitOn 5 [1..] !! 1) == take 50 [6..]

```

## Tesztek

TODO
