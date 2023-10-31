# 4. Házifeladat

> Those who don't believe in magic will never find it.  
> - Roald Dhal

Fáradtan dőlsz ki kollágiumi szobádban délután. Nem mondod, érdekes egy nap volt, sok új dolgot tanulhattál meg az akadémia berkein belül, de még mindig nem érted, mi köze lehet a varázslásnak a fránya sakktáblához!

Érzed, hogy lassan elnehezülnek pilláid, és szépen hív álom-föld, mire kopogást hallasz az ajtón. Lustán odavánszorogsz, ami közben egy kicsit már türelmetlenebb kopogtatás sürget.

Már nyitnád az ajtót, mire arcon vág Zeri a SAJÁT SZOBÁD ajtajával.

> Zerafin
> 
> > Azért ennyire nem nézek ki jól, hogy itt ájuldoz nekem!

Levegőt se tudsz venni, mire megfogja kezed, és talpadra állít.

> Zerafin
> 
> > Ha nem tévedek, most egészen érdekes dolgokat tanítottak neked a többiek, így már tudunk terep gyakorlatot tartani!

Ha eddig nem tűnt volna el az álmosság a szemedből, mostanra biztosan felébredtél. Szertelen mentorod terep gyakorlatra akar vinni?! Egyszerre érzel izgalmat, és félelmet. Vajon mit fogtok csinálni? Elmentek tán gaz lényekkel küzdeni? Megadjátok a szemét kis pixiknek ami kijár nekik? Talán már egy sárkányt is le fogtok gyűrni!

Alig fél óra múlva viszont annál nagyobb csalódottság uralkodik el rajtad, amint meglátod a sornyi asztalt, ahol varászlók és boszorkányok foglalnak helyet, előttük végeláthatatlan sor. Ezt a helyet egymásközött csak "közszolgálatnak" csúfolják a diákok, mivel alig félmaroknyi pénz fejében "kisehítheted" a nem olyan szerencsés embereket, akik vagy nem tudnak bánni a bennük rejlő erővel, vagy oly kevés jutott nekik, hogy nem tudnak érdemben semmi hasznosat kezdeni vele.

Zerire nézel, arcodon látszik, hogy nem éppen erre gondoltál "terepgyakorlat" címszó alatt, és hogy inkább vakarnád fel az ő hálóhelyiségét egy fogkefélem, mintsem itt dolgoz elemózsiáért.

> Zerafin
> 
> > Megjöttünk! Oh, az emlékek! Ha tudnád, milyen sok időt töltöttem ilyen helyen fiatal koromban! Oh, várj, hét tudod...

Fojt el magában egy apró kuncogást Zeri, te pedig forgatod szemeidet. Nem szeretnél végig hallgatni még egy nosztalgia túrát, így is elég volt az előző, igen részletes "mesedélután".

> Zerafin
> 
> > Szerintem tudod, mi lesz a mai feladatod. Ott egy üres asztal, csak neked lett üresen tartva. A célod, hogy minél több embernek tudjál segítséget nyújtani! Minden bűvigéről kérek egy másolatot ám!

Mély lélegzetet veszel. Jó, nem baj, ez is gyakorlás a számodra, megtanulod jól kihasználni a képességeidet, ÉS legalább egy kis pénzt is tudsz szerezni. Már ballagnál tovább, amikor egy vörös kóc-kupac lép oda hozzátok.

> ???
> 
> > Zeriiiiiii! Hát te vagy az?! Már azt hittem nem is jöttök!

Zerafin arcán mintha egy ideg rándult volna egyet, de te nem láthattad jól.

> Zerafin
> 
> > Ziziiiii! Hát te meg mijáratban erre?
> 
> Zizi
> 
> > Oh, te butus! Hát én felügyelem ezt a helyet már évek óta! Tudhatnád, ha hallgattál volna rám, és akár EGYSZER lejössz közénk.
> 
> Zerafin
> 
> > ...
> 
> Zizi
> 
> > És minden bizonyára ő a kis tanítványod! Nagyin különleges lehetsz ám, hogy Zeri így kisegít téged! És látom te is olyan önzetlen vagy, mint drága tanárod! Milyen kedves vagy, hogy fizetés nélkül vállalod a munkát!
> 
> Zerafin
> 
> > ...

Zerafin kicsit félve néz rád, mire szembe találja magát mérges tekinteteddel. Meg se várod, mit fog kiötleni ez a két jó madár, már haladsz is az asztalod felé.

## 0. Kötet cím és szinonímák

Mielőtt nagyban nekivágnál, Zerafin még utánad kiállt.

> Zerafin
> 
> > Ne feledd összeírni, amit alkottál! Adj neki egy feldőlapot, amire ráírod, hogy `Szolgalat`! Továbbá ügyelj arra, hogy itt sok ember fordul meg, mindenkinek más a szavajárása, így jobb, ha nem értesz valamit, akkor rákérdezel, hogy az mégis mit jelenthet!

Már veszed is elő a pennád, de Zizi szakít most félbe.

> Zizi
> 
> > És ne feledd! elégazásokat, őrfeltételeket, csúnya függvényeket nem szabad használnod, különben elvisz az inkvizíció! _halk kuncogás_

Kedves egy búcsú, de könnyeket nincs időd ejteni, mivel amint helyet fogalsz, már eléd is áll az első "ügyfeled".

## 1. Kereskedő a bajban

Elötted egy férfi áll szép, módos ruhában. Látod rajta, hogy az élet eléggé fevitte a dolgát, szinte biztos, hogy kezét sohase mocskolta be kétkezi munka. Kicsit megvetően néz le rád, ez azonban eltűnik, amint megköszörüli torkát.

> Kereskedő
> 
> > Nem rég történt egy kis "incidens", ami miatt sajnos el kellet bocsáltanom pár igen jó emberemet. Azóta viszont a raktáramba az áruk szanaszét állnak, és rendre kéne parancsolni őket.  
> > Szükségem lenne egy olyan szkriptúrára, ami szépen a falhoz sorolja őket, és olyan magasra pakolja ezt a "doboz hegyet", amilyen magasra én szándékozom.

```haskell
type Pile = String
```

Nem annyira tudod megérteni, pontosan mit szeretne, így gyorsan felrajzolsz egy apró ábrát, hogy te pontosan mit képzeltél el:

```plaintext
#
##
###
####
#####
######
```

A kereskedő kicsit hőbörögve, azonban rábólint. Valóban így szeretné látni az árukat.

```haskell
stockpile :: Int -> Pile
```

> Ne feledd, ilyen szépen csak akkor fog kiíródni a ghci-ben, ha meghívod a `putStr`-t! Az újsort a `\n` karakterrel tudod meghívni. Ha úgyes vagy, a végére nem raksz újsor karaktert, de az se gond, ha kerül a végére!

## 2. Posta kisegítése

Alig végeztél az előző feladatoddal, már kapod is a következőt.

Eléd áll egy kissé leharcolt fiú, oldalán egy hatalmas táska. Egyből felismered a táskán és mellkasán látható szimbólumot: Phost'al rend jele.

> Postás fiú
> 
> > Nagyon sok levelet szállítok ki nap mint nap, ebben nagyon is jó vagyok!

Veregeti meg mellkasát nagyon büszkén, ám ez a pillanatnyi büszkeség hamar eltűnik, és helyét szomotúság veszi át.

> Postás fiú
> 
> > Azonban a rendem nem akar kiküldeni minden nap. Szerintük "túl fiatal" vagyok. Ezért inkább a csomagolásokat bízzák rám, ami nekem viszont annyira nem megy... Olyan sok csomag jön egyszerre, és nem tudom őket ilyen gyorsan összekötni!

Háborodik fel a fiatal postás.

> Postás fiú
> 
> > Tudnál esetleg nekem segíteni ebben valahogy?

```haskell
type Package c d = (c , d)
```

Több kérdésed nincs is, már állsz is neki a rovásnak.

```haskell
pack :: [a] -> [b] -> [Package a b]
```

## 3. Gyógyszertári galiba

Nyújtod is a papírt nagy mosollyal a fiatal postásnak, de nincs megállás, jön a következő probléma.

Eléd áll egy fiatal hölgy, bőre természetet meghazuttolva porcelán fehér, ruhája ellenben élénk zöld, zsebeiből gyógynövények kandikálnak ki.

Milyen fura figurák járnak ide, nemde? Nem is számít, kezdi beszédét egy nagy mosollyal.

> Gyógyszerész
> 
> > Szia!  
> > Tudnál nekem segíteni?

Meglepődsz a kedvességén, majd hevesen bólogatsz.

> Gyógyszerész
> 
> > Szupi! Az a gondom, hogy soha se tudom összeszervezni a különböző gyógynövényeimet, így soha se tudom, pontosan miből mennyim van. Jó lenne őket egy helyen tartani, és felcimkézni, hogy mennyi van belőlük. Tudsz erre esetleg valami megoldást?

```haskell
type Ingredient = String
```

Mosolyogsz egyet kérésén, majd gondolkodás nélkül veted a szavakat.

```haskell
storage :: [Ingredient] -> [(Int, Ingredient)]
```

## 4. Tolvajbecsület

Talán már a rutin hozza, hogy ezeket a megoldásokat kapázsból papírra tudod vetni. Talán csak agyadra ment Zeri "tanítása" mivel szinte csak ilyen problémákat oldat meg veled. Mindenesetre, ezzel sem volt különösebb gondod.

Következőleg egy csuklyás alak áll eléd. Egész lénye csak azt sugározza, hogy nem kéne vele közelebbi kapcsolatot ápolnod.

Pár másodpercig hozzád se szól, csak áll ott, és méreget.

Mikor megszólal, hangja szinte elveszik a tömeg morajában, viszont annál több erőt, súlyt hordoz magában, hogy ne halljad meg.

> Tolvaj mester
> 
> > Szükségem lenne egy tekercsre, ami meg tudja mondani, valaki hazudik-e nekem, vagy sem. Ha a mondandójában akár egyszer is hazudott, akkor már riasszon nekem.

A hideg kiráz, de leírod, amit kér.

```haskell
type Statement = [Bool]
type Verdict = Bool
```

Megpróbálsz a szemébe nézni, kifürkészni, vajon ki is lehet, de ő csak áll ott némán

```haskell
notALie :: Statement -> Verdict
```

Nyújtanád is a papírost, mire ismét hozzád szól.

> Tolvaj mester
> 
> > Tolvaj tolvajnak nem hazudik. Ennyi becsületünk van egymás felé.

Egy lélegzetvételnyi szünetet hagy, majd folytatja.

> Tolvaj mester
> 
> > Azonban mind tudjuk, hogy annak jár az alamizsna, aki először találja meg. szükségem van egy varázslatra, ami riaszt nekem, ha a kincs megtalálója szól hozzám.

Ez már egy keményebb feladat, de nem rémülsz meg. Félre csúsztatod a már megírt igézésedet, majd bele kezdesz az újba.

```haskell
findersKeepers :: Statement -> Verdict
```

## 5. Az inkvizíció

Átnyújtod a művedet, és egy pillantás alatt el is tűnik a gyanús alak, mintha ott se lett volna. Pislogsz párat, és úgy döntesz, jobb csendben maradni.

Kiszolgász még pár embert, mire a távolból erős kiabalást hallasz.

> ???
> 
> > Mindenki megállj!

Nem is foglalkoznál vele, ha nem jelent volna meg melletted Zeri, és szorítja meg a válladat. A tömeg szét oszlik. A tér közepén pár kék ruhás férfi áll, kezükben könyv, kard.

> ???
> 
> > Az inkvizíció nevében minden bűbájt átviszgálunk! Ha nem adod át önként jegyzeteidet, halál vár rád!

Az egyik kék ruhás kardja markolatával gyomorba vágja a felszólalót.

> ???
> 
> > Börtön, akarom mondani börtön vár rád!

Elindulnak sorra a kihelyezett padokhoz, és vizsgálják a kiadott papiruszokat. A szónokló felétek indul, mire te láthatóan félni kezdesz, de Zerafin magabiztos keze támaszt nyújt válladon.

Oda ér a szónok, mire elsőként Zeri szólalmeg.

> Zerafin
> 
> > Ő exelenciája, minek köszönhetjuk ezt a megtiszteltetést?
> 
> ???
> 
> > Hagyjuk ezt a színjátékot Zeri. Adjátok át a papírt, és nem lesz semmi gond.
> 
> Zerafin
> 
> > Ahogy óhajtja, mélyen tisztelt Altair.
> 
> Altair
> 
> > ...

Vet pár pillantást szövegedre. Néhol meglepődik, kicsit gondolkozik, majd feléd fordul.

> Altair
> 
> > Nem tűnik úgy, hogy kezdővel lenne itt dolgunk. Ha nem probléma, alávetnélek egy tesztnek. Hacsak a barátod nem bánja.

Zeri nem szól egy szót se, ami igen meglepő tőle.

> Altair
> 
> > Készíts nekem egy olyan szöveget, ami képes megmutatni, hogy egy adott szövegben megtalálható-e akár egy darab tíltott mágikus szó! Ezeket a zsavakat majd én adom meg neki, hátha a jövőben változhatnak. És természeteen, nyugodtan használd a stócodban lévő igéket hozzá, és az eddigi ismereteidet.

Kérve-kelletlen, de neki állsz.

```haskell
inquisition :: [String] -> [String] -> Verdict
```

## 6. Királyi hírnök

Altair elismerően biccent. Tőledd távolabb eső asztaltól egy boszorkát a földre utasítanak, ám ő hevesen ellenkezik. Három ember végül lefogja, és elvezetik.

> Altair
> 
> > Mindig. Mindig van valaki, aki nem tudja a dolgok helyét...  
> > De ez ne tántorítson el senkit!

Emelte fel hangját végszavára, mire az inkvizíció tagjai összegyűltek, és közösen útjukra indultak.

Nem kellett sok idő, hogy a "biznisz" folytatódjon, sok kérést teljesítettél aznap, már lassan a nap is nyugovóra akart térni, mire díszes ruhában, egy alacsonyabb, öreg fickó eléd áll. Körbenéz, mielőtt hozzád szólna, ruházatán és arcán látszik, hogy nem éppen egy hétköznapi ember.

> Irattárnok
> 
> > Oh kedves! Had mondjam el, míly nyűgöm van nekem a király udvarában...  
> > Uralkodónk sorra kapja a mágikus papiruszokat, telis tele üzenettel, ám ezek nagy száma értelmezhetetlen humbug, vagy oly' üzenet, melyet nem szándékozik fogadni! Nekem, az irattárnoknak dolgom, hogy kiválogassam, mi kerül őfelsége elé, de szomorú az én sorsom. Nem tudok én ennyit olvasni, öreg vagyok én már. Oly' jó lenne egy masenéria, eszköz, ami engem ebben kisegítene!

### a) A hossz a lényeg

> Irattárnok
> 
> > Első sorban hasznomra várna, ha meg tudnám mondani, hogy egy adott szöveg hosszabb-e egy adott számnál! Öreg kezeim lehet félre ütnek, és véletlen lehet negatív számot viszek be, így jó lenne, ha erre is adna eredményt, és a mágikus papiruszok között vannak olyanok, amiket az ember a végtelenségig olvashatna, akkor se lenne vége!  
> > Ha ezt mind meg tudnád tenni, boldog lenne az én vén szívem...

```haskell
longerThan :: Int -> [a] -> Verdict
```

### b) Kéretlen tartalom

> Irattárnok
> 
> > Az erőlli kis hasznos igével, kérlek, csinálj egy olyan papirost, ami megmondja nekem, hogy a szöveg kéretlen-e! Egy szöveg akkor kéretlen, ha 3000 karatkernél több szöveg van benne, vagy egy sora több mint 15 szót tartalmaz!

```haskell
spamFilter :: String -> Verdict
```

## 7. Nyomokban furcsaságot tartalmazhat

Az írattárnok hálásan veszi át a varázslatodat, megrázza kezedet is.

Zerafin érkezik melléd, hátadat elismerően megveregeti, Zizi pedig vidáman kuncog a hátad mögött.

Persze, hogy ők ilyen vidámak, elvégre semmit sem dolgoztak egész nap...

Már szedelőzködnél, amikor Zizi lehajol melléd, szinte érzed arcodon a lehelletét.

> Zizi
> 
> > Van számodra egy kis feladatom! Tényleg kis semmiség, de van egy pár jegyzetem, amit szeretnék összefésülni úgy, hogy egyszer az egyik jegyzetből veszek ki egy fejezetet, utána a másikból. Meg tudnád nekem csinálni ezat az apróságot?

Nem fér a fejedbe, hogyan tud ez a két félésszel megáldott egyén ilyen jól időzíteni, de egye fene, belevágsz.

```haskell
merge :: [a] -> [a] -> [a]
```

## Bónusz: Csak pozitívan!

Összepakolsz, és ami méginkább meglepő, Zeri is segít neked.

De vége a napnak! Végre haza indultok, Zerafin segít a táskáddal, személyes holmiddal. Már félúton jártok, amikor hangja átvált a "bájcsevej" üzemmódból:

> Zerafin
> 
> > Ha gondolod, van még egy extra feladatom számodra!

Sóhajtasz egy nagyot, de nem szólsz rá, kíváncsi vagy, mi lehet, amit most kiötletelt.

> Zerafin
> 
> > A feladatod, hogy eldöntsed, egy szám negatív-e, és ha pozitív, akkor add vissza azt a számot! De vigyázz, továbbra se használhatsz vicces dolgokat, mint az őrfeltétel, elágazások, vagy más feltétel! Annyit segítek, hogy az sokat segít, hogy listát kell visszaadnod!

```haskell
justPositively :: (Eq a, Num a) => a -> [a]
```

## Tesztek

```haskell
    take 8 (stockpile 3) == "#\n##\n###"
    stockpile 0 == ""
    take ((40*40) - 1) (stockpile 40) == "#\n##\n###\n####\n#####\n######\n#######\n########\n#########\n##########\n###########\n############\n#############\n##############\n###############\n################\n#################\n##################\n###################\n####################\n#####################\n######################\n#######################\n########################\n#########################\n##########################\n###########################\n############################\n#############################\n##############################\n###############################\n################################\n#################################\n##################################\n###################################\n####################################\n#####################################\n######################################\n#######################################\n########################################"
    pack [9,10,5,0,1,2] "szilva" == [(9,'s'),(10,'z'),(5,'i'),(0,'l'),(1,'v'),(2,'a')]
    pack [9,10,5,0,1,2] "alma" == [(9,'a'),(10,'l'),(5,'m'),(0,'a')]
    pack "alma" ['a'..] == [('a','a'),('l','b'),('m','c'),('a','d')]
    pack [101..] "meggy" == [(101,'m'),(102,'e'),(103,'g'),(104,'g'),(105,'y')]
    take 10 (pack [101..] [1..]) == [(101,1),(102,2),(103,3),(104,4),(105,5),(106,6),(107,7),(108,8),(109,9),(110,10)]
    storage [] == []
    storage ["alma"] == [(1, "alma")]
    storage ["körte", "barack", "alma", "szilva", "alma", "eper", "körte", "körte", "barack"] == [(3,"körte"),(2,"barack"),(2,"alma"),(1,"szilva"),(1,"eper")]
    not (notALie [False , error "Nem lusta. :("])
    notALie (take 1000 (repeat True))
    findersKeepers [True, error "Nem lusta ez se :("]
    not (findersKeepers (take 1000 (repeat False)))
    inquisition ["length"] ["length xs"]
    inquisition ["length", "!!", "if", "map"] ["x : xs", "putStrLn \"88\"", "[] !! 10", "[x | y <- [1..5)]"]
    not (inquisition ["length", "!!", "if", "map"] ["lenthy maybe not", "!!isforbidden", "iftenelse is not good for your health!", "mapping the area"])
    1000 `longerThan` [1..]
    not (0 `longerThan` [])
    not (51 `longerThan` replicate 50 'a')
    25 `longerThan` [1..50]
    (-10) `longerThan` []
    (-1) `longerThan` [0,2..]
    (-100) `longerThan` [0,2..]
    (-1) `longerThan` [1]
    (-3) `longerThan` [[1,2],[4,9,10],[1,0]]
    spamFilter (repeat 'a')
    not (spamFilter "en elmentem a vasarba fel penzzel!")
    not (spamFilter "Marpedig ez a mondat igen is át kell\n hogy menjen a teszten!")
    spamFilter "Ez az eset pedig tudom, hogy teljes mértékben meg kell hogy bukjon a helyességi vizsgálatok közben is!"
    merge [1,3,5,7,9] [2,4,6,8] == [1..9]
    merge [] [1,10,12] == [1,10,12]
    merge [1,10,12] [] == [1,10,12]
    null (merge [] [])
    merge [1,2,3,4,5] [6,7] == [1,6,2,7,3,4,5]
    merge "ab" "cdefgh" == "acbdefgh"
    take 25 (merge "szilvafa" (repeat 'b')) == "sbzbiblbvbabfbabbbbbbbbbb"
```