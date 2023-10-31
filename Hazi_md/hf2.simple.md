# 2. Házifeladat

**FIGYELEM!** Ha továbbiakban olyat láttok, hogy **Bónusz feladat**, akkor azt a feladatot _**nem kötelező**_ megcsinálni. Ezek a feladatok valami érdekes dolgot mutatnak be, esetleg olyan koncepciót gyakoroltatnak, amik az 5-öst segíthetik könnyebben elérni.

***TOVÁBBÁ** ezentúl minden függvényhez meg kell adnotok a típust úgy, hogy az a lehető legáltalánosabb legyen, amennyiben maga a feladat szövege nem rendelkezik másképp (pl. a feladatban meg van adva, hogy mi kell legyen a függvény típusa).

## Komplex számok

> Megjegyzés: Komplex szám az egy olyan szám, aminek két komponense van. Van egy valós (Re), illetve egy ~~kitalált~~ imaginárius (Im) része. Általánosságban `a + b * i` módon jelöljük őket, ahol az `i` csak egy jelölés, nem helyettesítünk oda semmit, `a` és `b` pedig valós számok.

### 0. Modul

Definiálj egy modult Hazi2 néven!

### 1. Komplex számok összeadása, kivonása

Implementáld az `addC` függvényt az alábbi szignatúrával: `addC :: (Double,Double) -> (Double,Double) -> (Double,Double)`, illetve a `subC :: (Double,Double) -> (Double,Double) -> (Double,Double)` -t. Ezek fogják összeadni illetve kivonni a komplex számainkat.

> Tipp: `(a + b * x) + (c + d * x) = ((a + c) + (b + d) * x)`

### 2. Szorzás valóssal

Implementáld a `mulRC :: Double -> (Double,Double) -> (Double,Double)` függvényt, ami megszoroz egy komplex számot egy valóssal.

### 3. Konjugált

> Megjegyzés: Egy kifejezés konjukáltja egy olyan kifejezés, ami az eredetihez képest pontosan egy előjellel tér el.  
> Példa: `a + b * x^2` konjugáltja `a - b * x^2`

Implementáld a `conjC :: (Double,Double) -> (Double,Double)` függvényt, ami visszaadja egy komplex szám konjugáltját!

### 4. Szorzás komplex számmal

> Megjegyzés : `i * i = - 1`

Implementáld a `mulC :: (Double,Double) -> (Double,Double) -> (Double,Double)` függvényt, ami két komplex számot szoroz össze!

### Bónusz feladat: Komplex számok abszolút értéke

Egy komplex szám abszolútértékét pontosan úgy kell kiszámolni, mintha egy vektor hosszát. De ha találsz egyszerűbb módot, nyugodtan használd azt! :D

Ezek alapján implementáld a `absC :: (Double,Double) -> Double` függvényt!

> Segítség: Ehhez a feladathoz egy kis önálló munka kell, a megoldásban szükséges egy olyan függvény, amit nem mutattam. Utánanézni esetleg a Floating nevű osztályra rákeresve lehet ghci-ben vagy [hoogle](https://hoogle.haskell.org/)-ön.

## Tesztesetek

**FIGYELEM!** A tesztek mindig tájékoztató jellegűek. Ha a kód ezeknek megfelel, még nem jelenti azt, hogy jó és el lesz fogadva, érdemes tovább tesztelni, próbálgatni, legfőképpen a szélsőséges eseteket.

```haskell
addC (1,2) (4,5) == (5,7)
addC ((-1),5) (7,8) == (6,13)
abs (fst (addC (1.22, 3.2) (5.48, 3.8)) - 6.7) < 0.00001
abs (snd (addC (1.22, 3.2) (5.48, 3.8)) - 7.0) < 0.00001
subC (1,2) (4,5) == ((-3),(-3))
subC (10,9) (7,8) == (3,1)
abs (fst (subC (1.22, 3.2) (5.48, 3.8)) + 4.26) < 0.00001
abs (snd (subC (1.22, 3.2) (5.48, 3.8)) + 0.6) < 0.00001
mulRC 6 (5,0) == (30,0)
mulRC (-2) (6,7) == ((-12),(-14))
mulRC 0 (4.5, (-7.897)) == (0.0,0.0)
abs (fst (mulRC 1.764 (3.45, (-0.23))) - 6.0858) < 0.00000001
abs (snd (mulRC 1.764 (3.45, (-0.23))) + 0.40572) < 0.00000001
fst (conjC (10, -7)) == 10
snd (conjC (10, -7)) + snd (10, -7) == 0
mulC (5, 6) (2, 7) == (-32, 47)
mulC (0 , 4278943517) (3475212278212, 0) == (0, 14870237048054037751604)
snd (mulC (3.75, 1.35) (2.115, 7.875)) - 32.3865 < 0.00000001
fst (mulC (3.75, 1.35) (2.115, 7.875)) - 2.7 < 0.00000001
```