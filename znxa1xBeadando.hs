module NagyBeadando where
   -- SSH teszt
   
   -- Type Alias
   type Name = String
   type Health = Integer
   type Spell = (Integer -> Integer)
   type Army = [Unit]
   type EnemyArmy = Army
   type Amount = Integer

   --------------------
   data State a = Alive a
                | Dead

   instance Show a => Show (State a) where
      show (Alive a) = show a
      show (Dead) = "Dead"

   instance Eq a => Eq (State a) where
      (Alive a) == (Alive b) = a == b
      Dead == Dead = True

   --------------------
   data Entity = Golem Health
               | HaskellElemental Health

   instance Show Entity where
         show (Golem healt) = show healt
         show (HaskellElemental healt) = show healt

   instance Eq Entity where
         (Golem hp1) == (Golem hp2) = hp1 == hp2
         (HaskellElemental hp1) == (HaskellElemental hp2) = hp1 == hp2

   --------------------
   data Mage = Master Name Health Spell
   
   instance Show Mage where
         show (Master name hp spell)
            | hp < 5 = "Wounded "++name
            | otherwise = name

   instance Eq Mage where
         (Master n1 hp1 _) == (Master n2 hp2 _) = n1 == n2 && hp1 == hp2

   --------------------
   data Unit = M (State Mage)
             | E (State Entity)

   instance Show Unit where
         show (M a) = show a
         show (E a) = show a

   instance Eq Unit where
         (E Dead) == (M Dead) = True
         (M Dead) == (E Dead) = True
         (M state1) == (M state2) = state1 == state2
         (E state1) == (E state2) = state1 == state2

   --------------------
   formationFix :: Army -> Army
   formationFix army = fst (takeOutDead army ([], [])) ++ snd (takeOutDead army ([], []))
      where
         takeOutDead :: Army -> (Army, Army) -> (Army, Army)
         takeOutDead [] acc = acc
         takeOutDead (a:as) (alive, dead)
            -- | M Dead <- a = takeOutDead as (alive, a:dead)
            | (show a) == "Dead" = takeOutDead as (alive, a:dead)
            | otherwise = takeOutDead as (alive ++ [a], dead)

   --------------------
   over :: Army -> Bool
   over [] = True
   over (x:xs) = show x == "Dead" && over xs

   -- Helper functions
   modifyAliveHP :: Unit -> Integer -> Unit
   modifyAliveHP (E (Alive (HaskellElemental a))) x
      | x <= 0 = (E Dead)
   modifyAliveHP (E (Alive (HaskellElemental a))) x = (E (Alive (HaskellElemental x)))
   --------------------
   modifyAliveHP (E (Alive (Golem a))) x
      | x <= 0 = (E Dead)
   modifyAliveHP (E (Alive (Golem a))) x = (E (Alive (Golem x)))
   --------------------
   modifyAliveHP (M (Alive (Master name hp spell))) x
      | x <= 0 = (M Dead)
   modifyAliveHP (M (Alive (Master name hp spell))) x = (M (Alive (Master name x spell)))
   --------------------
   modifyAliveHP (M Dead) _ = (M Dead)
   modifyAliveHP (E Dead) _ = (E Dead)

   --------------------
   getAttackDamage :: Unit -> Integer
   getAttackDamage (E (Alive (HaskellElemental _))) = 3
   getAttackDamage (E (Alive (Golem _))) = 1

   --------------------
   getHP :: Unit -> Integer
   getHP (E (Alive (HaskellElemental a))) = a
   getHP (E (Alive (Golem a))) = a
   getHP (M (Alive (Master name hp spell))) = hp

   --------------------
   fight :: EnemyArmy -> Army -> Army
   fight [] army = army
   fight _ [] = []
   fight (unit@(E (Alive z)):ex) (a:ax) = (modifyAliveHP a ((getHP a) - (getAttackDamage unit))) : fight ex ax
   fight ((M (Alive (Master name hp spell))):ex) unit@(a:ax) = (newUnit a) : fight ex (masterAttack spell ax)
      where
         masterAttack :: (Integer -> Integer) -> Army -> Army
         masterAttack _ [] = []
         masterAttack spell (x:xs) = (newUnit x) : masterAttack spell xs
         newUnit :: Unit -> Unit
         newUnit x = modifyAliveHP x (spell (getHP x))

   --------------------
   haskellBlast :: Army -> Army
   haskellBlast [] = []
   haskellBlast army@(a:ax) = modifyFrom army (getBestFiveIndex army 0 0 0 0) 0
      where
         getBestFiveIndex :: Army -> Integer -> Integer -> Integer -> Integer -> Integer
         getBestFiveIndex [] _ bi _ _ = bi
         getBestFiveIndex army@(x:xs) i bi bs md
            | mostDead (take 5 army) == 5 = i
            | mostDead (take 5 army) > md || (getHpSum (take 5 army)) > bs && mostDead (take 5 army) > md = getBestFiveIndex xs (i+1) i (getHpSum (take 5 army)) (mostDead (take 5 army))
            | otherwise = getBestFiveIndex xs (i+1) bi bs md
         --------------------
         getHpSum :: Army -> Integer
         getHpSum [] = 0
         getHpSum (x:xs) = getHP x + getHpSum xs
         --------------------
         mostDead :: Army -> Integer
         mostDead [] = 0
         mostDead (x:xs)
            | (getHP x) - 5 >= 0 = 1 + mostDead xs
            | otherwise = 0 + mostDead xs
         --------------------
         modifyFrom :: Army -> Integer -> Integer -> Army
         modifyFrom [] _ _ = []
         modifyFrom (x:xs) bs i 
            | i >= bs && i <= bs+4 = modifyAliveHP x ((getHP x) - 5) : modifyFrom xs bs (i+1)
            | otherwise = x : modifyFrom xs bs (i+1)
         --------------------
      
   -- multiHeal helper
   countNotDead :: Army -> Integer
   countNotDead [] = 0
   countNotDead (x:xs)
      | (show x) == "Dead" = countNotDead xs
      | otherwise = 1 + countNotDead xs

   
   multiHeal :: Health -> Army -> Army
   multiHeal _ [] = []
   multiHeal hp xs
      | (length xs) - fromIntegral((countNotDead xs)) == length xs = xs
   multiHeal hp army = check (helper hp army (0,[]))
      where
         helper :: Health -> Army -> (Integer, Army) -> (Integer, Army)
         helper hp xs (hpAcc, acc)
            | null xs = (hpAcc, acc)
            | hp == 0 = (hpAcc, acc ++ xs)
         helper hp (x:xs) (hpAcc, acc)
            | show x == "Dead" = helper (hp) xs (hp,acc ++ [x])
            | show x /= "Dead" = helper (hp-1) xs (hp-1,acc ++ [modifyAliveHP x (getHP x + 1)])
         check :: (Integer, Army) -> Army
         check (hp, army)
            | hp == 0 = army
            | otherwise = check (helper hp army (0,[]))

   -- Potion Master
   potionMaster =
      let plx x
            | x > 85  = x - plx (div x 2)
            | x == 60 = 31
            | x >= 51 = 1 + mod x 30
            | otherwise = x - 7
      in Master "PotionMaster" 170 plx

   -- Masters
   papi = let
      tunderpor enemyHP
         | enemyHP < 8 = 0
         | even enemyHP = div (enemyHP * 3) 4
         | otherwise = enemyHP - 3
      in Master "Papi" 126 tunderpor

   java = Master "Java" 100 (\x ->  x - (mod x 9))
   traktor = Master "Traktor" 20 (\x -> div (x + 10) ((mod x 4) + 1))
   jani = Master "Jani" 100 (\x -> x - div x 4)
   skver = Master "Skver" 100 (\x -> div (x+4) 2)

   -- Tests
   showState a = show a
   showMage a = show a
   eqMage a b =  a == b
   showUnit a = show a
   showOneVOne a = show a
