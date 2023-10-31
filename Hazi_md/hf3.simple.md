# 3. Házifeladat

> Magic's just science that we don't understand yet.  
> - Arthur C. Clarke

Távol innen, számunkra tán nem is olyan ismeretlen helyen, létezik egy világ, ahol a mágia nem holmi népmese. Egy hely, ahol a szavak ereje hatalmasabb annál, mint amit el tudsz képzelni.

Pontosan ezért is oly nagy dicsőséget, ha valaki mesterien bánik mondataival, és a világot képes olyan alakra formálni, mint amit megálmodott, ám ennek ára, hogyha rosszul utasítasz, magadban okozhatsz kárt.

Ezt elkerülendő jöttek létre a különböző iskolák, amik segítik fiatal tanoncokat, hogy elsajátítsák az alapvető módszereket, és kialakítsák saját stílusukat.

Saját stílusukat? Így bizony! Hiszen nem csak egy nyelv létezik a világon, nem csak egy módja van annak, hogy kifejezzük magunkat. Éppen ezért se célja ezeknek az intézményeknek, hogy diákjaira ráerőltessék saját szokásaikat, hanem mindenki úgy tudja használni a mágia hatalmát, ahogy neki kényelmes. ~~Persze, a hagyományokat így is tiszteletben tartva.~~

Egyik ilyen iskola oktatója Zerafin, vagyis ahogy egyesek becézik: Zeri, aki készségesen vállalta a pártfogói, mentor szerepet számodra, mivel meglátott benned valamit, ami társaidban úgy tűnik, nincs meg.

Ki is tűzte számodra az első feladatod! Mosolyogva nyom egy papírt a kezedbe, aminek tartalmát izgatottan olvasod: **Hallgasd végig a történetem!**

Csalódottan nézel fel életvidám mentorodra. Érzed, hogy egy unalmas előadás következik...

## 0. Varázs cím és szinonímák

De mindenek előtt, Zerafin felhívja rá a figyelmedet, hogy ki fog kérdezni a kiselőadásából! Gyorsan előveszel egy papírt, és kapnál pennád, tintád után, de csak ekkor veszed észre, hogy otthon felejtetted. Habár megesküdnél, hogy reggel még tarsolyod mélyén ott lapult, ezért mégegyszer áttúrod holmijaidat,, de sehol sem találod. Pánikra azonban semmi gond, mestered asztalodra tesz tollat, és hozzá tintát. Kicsit érdekes a színe, de időd sincsen jobban megvizsgálni a tárgyakat, ugyanis a másik már kezdi is mondandóját!

> Zerafin:
> 
> > Minden történetnek kell egy jó cím! Adjunk ennek is egyet. Legyen a neve `Fozetek`, mivel annak idején én egy egyszerű falusi boszorkányként kezdtem a pályafutásomat.

Jegyzed is gyorsan hatalmas betűkkel a papirosod tetejére a címet.

> Zerafin:
> 
> > Továbbá jobb ha tudod, hogy az összetevőket mindig fiolákban tárolom. Ezeket felcímkézem, mind a nevükkel, mind a benne lévő mennyiséggel. Lehet, hogy megszokásból csak ezeket fogom mondani a receptjeimhez, ami több ilyen összetevőkből áll. Többet nem fogok szólni e miatt.

Veted is a következő betűket:

```haskell

type Osszetevo = (Integer , String)
type Osszetevok = [Osszetevo]
type Recept = Osszetevok

```

> Zerafin:
> 
> > Lehet tanultál más mágusoktól is, más-más módszereket, de ne feledd, most az én órámon vagy! Szóval olyan dolgokat, mint "feltételek", "őrfeltételek", furcsa nevű szavak, mint a `map` nem használhatsz, különben itt helyben elátkozlak.

Nem rémülsz meg a fegyegetésétől, de érzed, hogy nem lenne jó ellenszegülni neki.

> Zerafin:
> 
> > Nos, így már kezdhetjük is a mesé... előadásunk! AZ ELŐADÁSUNK!

## Üvegcse méretek

Mestered már egy ideje mondja mondandóját; lassan úgy érzed, szemhéjaid elnehezednek, ám hamar eltűnik ez az érzés, amikor felemeli hangját.

> Zerafin:
> 
> > Ugyanis, drága tanoncom, a rend; mondom A REND a lelke mindennek. Ezt a nehéz úton tanultam meg, amikor a kis üvegcséim már ellepték egy egész szobámat. Szóval elszántam magam, és az összes olyan üvegcsét, amiben több volt egy adott mennyiségnél, át pakoltam a raktárba. És erre mit használtam?

Nézett rád árvus szemekkel, mire te csak fáradt pillantásokkal tudtál válaszolni.

> Zerafin:
> 
> > Varázslatot, mi mást!  
> > Szerintem neked van már elég tapasztalatod ebben a témában, szóval had lám, mutass nekem egy varázslatot, ami pontosan ezt valósítja meg.

Szemeidben remény csillan, tennéd is le a tollat, mire tanárod rosszallóan néz rád, és mutat a papírra. Ekkor is érted meg, hogy milyen ember vett szárnyai alá: egy boszorkány, aki az írott szóval bűvöl, nem a kimondottal...

```haskell

ujratolt :: Osszetevok -> Integer -> Osszetevok

```

### Egyszerű receptek

> Zerafin: Amint végeztem a fiolákkal, jöttek a receptek. Azonban nem akartam mindegyiket végignézni aznap, csak azokat, amikhez pontosan egy komponens kell. Persze, itt se kézzel néztem végig, hogy melyik milyen. Készítettem egy apró igét, ami megmondja nekem, hogy a következő recept egyszerű-e, és ezt használtam fel később. De ne szaladjunk előre, csináld most csak meg ezt az egyszerű feladatot.

Kicsit hitetlenkedve nézel rá, de megteszed, amit kér.

```haskell

egyszeru :: Recept -> Bool

```

### Zeri kedvenc receptjei

> Zerafin:
> 
> > Másnap azokat a recepteket néztem át, amik megmozgatják a fantáziám, olyan komplexek, vagy mert érdekes alapanyagok kellenek hozzá. Azok, amik nekem tetszenek minimum négy komponensből állnak, az érdekes főzetek pedig csak 2 komponensből állnak. Szerintem mostmár tudod, mit fogok tőled kérni.

Néz rád gonosz mosollyal mentorod, mire te már fel se nézel, csak írod a szöveget, unott arckifejezéssel.

```haskell

kedvenc ::  Recept -> Bool

```

## Lyukas tarisznya

Meglepő, de miután három "apróbb" feladatot kirótt rád, folytatta élettörténetét. Elmondta neked hogyan teltek mindennapjai a faluban, hogyan verte át a szomszéd megye urát, milyen barátságokat kötött. Egész érdekesnek találod, és rá kell jönnöd, hogy egész jó előadó Zeri, de szíved szerint inkább kint lennél a szabadban, és próbálgatnád magad, milyen igéket tudsz létrehozni.

Mintha gondolataidban olvasna, keresztbe teszi karjait, és szemedbe néz.

> Zerafin
> 
> > Ha már van annyi szabadságod, hogy csak úgy ábrándozz, akkor ezt is biztosan meg tudod oldani. Ekkor tájt kaptam meg az üzenetet drága intézményünktől, hogy meghívnának alapító oktatónak. Balszerencsémre, nem vettem észre, hogy tarisznyám kilyukadt. Éppen ezért, ha kettő, vagy annál kevesebb összetevőt tettem bele, csak úgy kifolyt, üres lett.  
> > Készíts nekem egy igét, ami megmondja nekem, milyen összetevők maradtak benne. Ha nincs benne összetevő, akkor mondja, hogy "üres".

Bevallod, meglepődtél, de egy kihívásra sohase mondanál nemet.

```haskell

tarisznya ::  Osszetevok ->  Osszetevok

```

## Viccelődő pixik

Elismerően biccent, amint elolvassa, amit írtál, de így se hagy nyugodni.

> Zerafin:
> 
> > Utam során több érdekes lénnyel találkoztam már. Ezek közül az egyik legkellemetlenebbek a pixik, ugyanis észrevétlenül ellopják különböző ingóságaimat. Egyik kedvenc játékuk, hogy a harmadik, de CSAK A HARMADIK üvegcsémet ellopják. Ha valaha kevesebb, mint három üvegcsével utaztam, hozzá se nyúltak.

Már éppen szóltál volna, hogy akkor viszont kiesik a tarisznyából, hiszen lyukas, de rájöttél, hogy addigra már nagy eséllyel megjavíttatta.

> Zerafin
> 
> > A következő feladatod, hogy egy olyan bűbájt készíts, ami visszaadja, milyen összetevők maradtak nálam egy ilyen út után.

```haskell

pixi :: Osszetevok ->  Osszetevok

```

## Varázs könyv szortírozás

> Zerafin:
> 
> > Amint megérkeztem, nem voltam rest, és elkészítettem az első pár órám vázlatát. Ehhez azonban szükségem volt az összes egyszerű receptemre.  
> > Ha nem csal a memóriám, a teszt kitöltésekor mutattás egy érdekes "rövidítést" a kiválogatásokra, generálásra. Mutasd meg mit tudsz, és használd azt, meg az eddig készített varázslataidat!

Érzed már, hogy fáradsz, de nem akarod feladni. Talán ez lesz az utolsó feladatod. Talán...

```haskell

konyv :: [Recept] -> [Recept]

```

## Félreértések

Érzed, hogy lassan minden erőd elhagy. Mennyi idő telt el?

Ránézel az órára, és szomorúan konstatálod, hogy ez az örökkévalóság a igazából csak két óra volt.

> Zerafin:
> 
> > Utolsó feladatod következik.

Szemed felcsillan, amint ezt meghallod. Szinte már érzed a hőn áhított forrócsokoládédnak, és a szabadságnak az ízét.

> Zerafin:
> 
> > Történetünk zárásaként mesélek egy régi barátnőmről, Ziziről. Őt is meghívták oktatni, és amennyire jól tudom, már a levél megérkezésének napján elindult. Ezt még aznap el is mondta nekem, mivel amikor elindultam hálóhelyiségem felé, szembe találtam magam vele. Csacsogtunk, beszélgettünk, és meg akartam vele osztani vele a jegyzeteimet, de rá kellett jönnöm, hogy ő nem érti az én jelöléseimet, így kénytelen voltam átváltani őket.  
> > A feladatod, hogy készíts egy olyan apró bűvigét, ami két egész számot, amik máshogyan vannak jelölve, adj össze, majd egy közös jelölési rendszerben add vissza.

Fáradtan, de a szabadságon felbuzdulva, neki is állsz az megoldásnak.

```haskell

zizi :: (Integral a , Integral b) => a -> b -> Int

```

## Bónusz feladat: Sok hazugság sem tesz egy igazat

> Zerafin:
> 
> > Szép munka, ügyesen megoldottad a feladataim, és kibírtad a mesélésemet. Kicsit hosszúra nyúlt, tudom.

Értetlenség ül ki arcodon. Ha ő is tudta, milyen hosszúra húzta, akkor miért nem hagyta abba, vagy kezdtetek el új dolgokat tanulni.

> Zerafin:
> 
> > A mai nap már csak pihenj, megérdemled.

Már éppen indulnál is utadra, azonban Zeri utánad szól.

> Zerafin:
> 
> > De ha kedved támadna egy kis feladványhoz, akkor van egy fejtörőm, amire egy sorban szabad csak válaszolnod!

A kezedbe nyom egy papirost, majd mindenféle magyarázat nélkül elhagyja a termet, téged otthagyva.

A papiroson az alábbi szöveg áll:

```plaintext

Hazudj, amíg tudsz, de egyedül nem érsz semmit.
Két hazug kell, akkor szavuk közt kincset lehet lelni.
Ha igazat vall mind, hát tudd, átvernek, és hamis mit kiálts!
Ám ha egyik galád, és a másik pedig jó, igaz az állítás.
Ha hazudik mind, akkor szavukban nem bízhatsz.
Szólj hát nékem, és megoldásra virradsz.

```

alatta a `kethazug :: Bool -> Bool -> Bool` áll, kiemelve. Úgy érzed, a tekercsre ennek a szövegnek mindenképpen rá kell kerülnie.

## Tesztesetek

```plaintext

ujratolt [] 0 == []
ujratolt [(10, "Kapor"), (150, "Paprika"), (0, "Kamilla"), (10, "Sárkány pikkely")] 10 == [(10, "Kapor") ,(150, "Paprika"), (10, "Sárkány pikkely") ]
ujratolt [(10, "Kapor"), (150, "Paprika"), (0, "Kamilla"), (10, "Sárkány pikkely")] 150 == [(150, "Paprika")]
ujratolt (take 1000000 ([x | _ <- [0..], x <- [(10, "Kapor"), (150, "Paprika"), (0, "Kamilla"), (10, "Sárkány pikkely")]])) 151 == []
not (egyszeru [])
egyszeru [(10000000000000, "Varangy láb")]
not (egyszeru [(0, "Hóvirág"), (0, "Eukaliptusz")])
not (egyszeru [(10, "Almaszirom") | _ <- [0..]])
kedvenc [(10, "Almaszirom") | _ <- [0..]]
not (kedvenc [])
not (kedvenc [(1, "Alma"), (2, "Katica szárny"), (3, "Kiskacsatoll")])
kedvenc [(3,"Fekete Gyöngy"),(2,"Sárkány utolsó lehellete")]
tarisznya [] == []
tarisznya [(1, "Funkcionális programozó imperatív kódja")] == []
tarisznya [(1, "Zserbó macskájának bajsza"), (66, "Unkomplex komplex számok")] == []
take 2 (tarisznya ([ x | _ <- [0..], x <- [(150, "Curry por"), (8, "Karamella"), (77, "Négylevelű lóhere")]])) == [(150, "Curry por"), (8, "Karamella")]
pixi [] == []
pixi [(15, "Clean por"), (8, "Méz")] == [(15, "Clean por"), (8, "Méz")]
pixi [(15, "Clean por"), (8, "Méz"), (34, "Cékla")] == [(15, "Clean por"), (8, "Méz")]
take 100000 (pixi [x | _ <- [0..], x <- [(7, "Meggy szár"), (23, "Tücsök ciripelés"), (99, "Hallgatói félelem")]]) == take 100000 ([(7, "Meggy szár"), (23, "Tücsök ciripelés")] ++ [x | _ <- [0..], x <- [(7, "Meggy szár"), (23, "Tücsök ciripelés"), (99, "Hallgatói félelem")]])
konyv [] == []
konyv [[(-10, "Könyv")]] == [[(-10, "Könyv")]]
konyv [[(16, "Morák könnye"), (100, "Vaják vér")]] == []
take 10 (konyv [[((9 :: Integer) ,y) | y <- take i ["Ördögi kör", "Halál csókja", "Hajnalcsillag első sugara"]] | _ <- [0..], i <- [1..3]]) == [[((9 :: Integer) , "Ördögi kör")]| _ <- [1..10]]
zizi (0 :: Int) (0 :: Integer) == 0
zizi (10 :: Integer) (32 :: Int) == 42
zizi (-30 :: Integer) (14 :: Integer) == -16
zizi (-45236723314796256 :: Int) (45236723314796256 :: Int) == 0
zizi ((2 ^ 64) :: Integer) (1 :: Integer) == 1

```