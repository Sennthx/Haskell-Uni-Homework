module NagyBeadando where

   -- Tipus Aliasok
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
            | (show a) == show (M Dead) = takeOutDead as (alive, a:dead)
            | (show a) == show (E Dead) = takeOutDead as (alive, a:dead)
            | otherwise = takeOutDead as (alive ++ [a], dead)

   over :: Army -> Bool
   over [] = True
   over (x:xs) = show x == "Dead" && over xs

   -- Segéd függvények
   modifyAliveHP :: Unit -> Integer -> Unit
   modifyAliveHP (E (Alive (HaskellElemental a))) x = (E (Alive (HaskellElemental x)))
   modifyAliveHP (E (Alive (Golem a))) x = (E (Alive (Golem x)))
   modifyAliveHP (M (Alive (Master name hp spell))) x = (M (Alive (Master name x spell)))

   getAttackDamage :: Unit -> Integer
   getAttackDamage (E (Alive (HaskellElemental _))) = 3
   getAttackDamage (E (Alive (Golem _))) = 1

   getHP :: Unit -> Integer
   getHP (E (Alive (HaskellElemental a))) = a
   getHP (E (Alive (Golem a))) = a
   getHP (M (Alive (Master name hp spell))) = hp



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

   {- fight ex ax = eval ex ax ax
      where
         eval :: EnemyArmy -> Army -> Army -> Army
         eval  -}

   potionMaster =
      let plx x
            | x > 85  = x - plx (div x 2)
            | x == 60 = 31
            | x >= 51 = 1 + mod x 30
            | otherwise = x - 7
      in Master "PotionMaster" 170 plx

   -- Mesterek
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

   -- Tesztek
   showState a = show a
   showMage a = show a
   eqMage a b =  a == b
   showUnit a = show a
   showOneVOne a = show a
