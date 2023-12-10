module NagyBeadando where
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
               deriving(Show,Eq)
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
      show (M (Alive a)) = show a
      show (E (Alive a)) = show a
      show (E a) = show a
      show (M a) = show a

   instance Eq Unit where
      (M state1) == (M state2) = state1 == state2
      (E state1) == (E state2) = state1 == state2
      _ == _ = False

   --------------------
   formationFix :: Army -> Army
   formationFix army = fst (takeOutDead army ([], [])) ++ snd (takeOutDead army ([], []))
      where
         takeOutDead :: Army -> (Army, Army) -> (Army, Army)
         takeOutDead [] (alive, dead) = (alive, reverse dead)
         takeOutDead (a:as) (alive, dead)
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

   -- Helper functions
   --------------------
   getAttackDamage :: Unit -> Integer
   getAttackDamage (E (Alive (HaskellElemental _))) = 3
   getAttackDamage (E (Alive (Golem _))) = 1
   --------------------
   getHP :: Unit -> Integer
   getHP (E (Alive (HaskellElemental a))) = a
   getHP (E (Alive (Golem a))) = a
   getHP (M (Alive (Master name hp spell))) = hp
   getHP (E Dead) = 0
   getHP (M Dead) = 0
   --------------------
   fight :: EnemyArmy -> Army -> Army
   fight [] army = army
   fight _ [] = []
   fight (unit@(E Dead):ex) (a:ax) = a : fight ex ax
   fight (unit@(M Dead):ex) (a:ax) = a : fight ex ax
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
            | mostDead (take 5 army) == 25 = i
            | mostDead (take 5 army) > md || (getHpSum (take 5 army)) > bs && mostDead (take 5 army) > md = getBestFiveIndex xs (i+1) i (getHpSum (take 5 army)) (mostDead (take 5 army))
            | otherwise = getBestFiveIndex xs (i+1) bi bs md
         -- Helper functions
         -------------------- 
         getHpSum :: Army -> Integer
         getHpSum [] = 0
         getHpSum (x:xs) = getHP x + getHpSum xs
         --------------------
         mostDead :: Army -> Integer
         mostDead [] = 0
         mostDead (x:xs)
            | (getHP x) - 5 >= 0 = 5 + mostDead xs
            | otherwise = (getHP x) + mostDead xs
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

   countDead :: Army -> Integer
   countDead [] = 0
   countDead (x:xs)
      | (show x) == "Dead" = 1 + countDead xs
      | otherwise = countDead xs
   
   multiHeal :: Health -> Army -> Army
   multiHeal hp xs
      | hp < 0 = xs
      | over xs = xs
      | otherwise = (helper hp xs [])
         where
            helper :: Health -> Army -> Army -> Army
            helper hp xs acc
               | hp > 0 && null xs = multiHeal hp acc
               | null xs = acc
               | hp <= 0 = acc ++ xs
            helper hp (x:xs) acc
               | show x == "Dead" = helper (hp) xs (acc ++ [x])
               | show x /= "Dead" = helper (hp-1) xs (acc ++ [modifyAliveHP x (getHP x + 1)])
               
   ------------------------
   --- Bonusz feladatok ---
   ------------------------
   battle :: Army -> EnemyArmy -> Maybe Army {- vagy EnemyArmy lesz az eredmény. -}
   battle army eArmy = getWinner (fightUntilIsOver army eArmy)
      where
         fightUntilIsOver :: Army -> EnemyArmy -> (Army, EnemyArmy)
         fightUntilIsOver a ea
            | over a || over ea = (a, ea)
            | otherwise = fightUntilIsOver (formationFix (multiHeal 20 (haskellBlast (fight ea a)))) (formationFix (fight a ea))
         getWinner :: (Army, EnemyArmy) -> Maybe Army {- vagy EnemyArmy -}
         getWinner (a, ea)
            | over a && over ea = Nothing
            | over a  && not (over ea) = Just ea
            | over ea = Just a

   ------------------------
   chain :: Amount -> (Army, EnemyArmy) -> (Army, EnemyArmy)
   chain amount ([], xs) = ([], xs)
   chain amount tupple
      | amount <= 0 = tupple
   chain amount (a, ea) = chainR amount a ea [] [] False
         where
            chainR :: Amount -> Army -> EnemyArmy -> Army -> EnemyArmy -> Bool -> (Army, EnemyArmy)
            chainR amount army enemy aAcc eaAcc b
               | amount <= 0 = ((aAcc ++ army, eaAcc ++ enemy))
            chainR amount army@(a:ax) [] aAcc eaAcc False = (aAcc ++ ((modifyAliveHP a ((getHP a) + amount)):ax), eaAcc)
            chainR amount [] enemy@(ea:eax) aAcc eaAcc True = (aAcc, eaAcc ++ ((modifyAliveHP ea ((getHP ea) - amount)):eax))
            chainR amount [] [] aAcc eaAcc b = (aAcc, eaAcc)
            chainR amount army@(a:ax) enemy@(ea:eax) aAcc eaAcc (True)
               | amount > 0 && show ea /= "Dead" = chainR (amount-1) army eax aAcc (eaAcc ++ [(modifyAliveHP ea ((getHP ea) - amount))]) False
               | amount > 0 && show ea == "Dead" = chainR (amount) army eax aAcc (eaAcc ++ [ea]) False
            chainR amount army@(a:ax) enemy@(ea:eax) aAcc eaAcc (False)
               | amount > 0 && show a /= "Dead" = chainR (amount-1) ax enemy (aAcc ++ [(modifyAliveHP a ((getHP a) + amount))]) eaAcc True
               | amount > 0 && show a == "Dead" = chainR (amount) ax enemy (aAcc ++ [a]) eaAcc True

   ------------------------
   battleWithChain :: Army -> EnemyArmy -> Maybe Army {- vagy EnemyArmy lesz az eredmény. -}
   battleWithChain army enemy = getWinner (fightUntilIsOver army enemy)
      where
         fightUntilIsOver :: Army -> EnemyArmy -> (Army, EnemyArmy)
         fightUntilIsOver a ea
            | over a || over ea = (a, ea)
            | otherwise = fightUntilIsOver (formationFix (fst(chain 5 ((multiHeal 20 (haskellBlast (fight ea a))), fight a ea)))) (formationFix (snd (chain 5 ((multiHeal 20 (haskellBlast (fight ea a))), fight a ea))))
         getWinner :: (Army, EnemyArmy) -> Maybe Army {- vagy EnemyArmy -}
         getWinner (a, ea)
            | over a && over ea = Nothing
            | over a && not (over ea) = Just ea
            | over ea = Just a

   ------------------------
   data OneVOne = Winner String 
                | You Health OneVOne 
                | HaskellMage Health OneVOne 
               deriving(Eq)

   instance Show OneVOne where
      show a = "<" ++ formatWinner a ++ ">"
         where
            formatWinner (Winner name) = "|| Winner " ++ name ++ " ||"
            formatWinner (You hp next) = "You " ++ show hp ++ "; " ++ formatWinner next
            formatWinner (HaskellMage hp next) = "HaskellMage " ++ show hp ++ "; " ++ formatWinner next

   ------------------------
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
