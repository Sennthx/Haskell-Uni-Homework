module Anima where
    --------------------
    data Monster = Faey | Elemental | Dragon
        deriving(Eq)
    --------------------
    {-
    instance Eq Monster where
    Faey == Faey = True
    Elemental == Elemental = True
    Dragon == Dragon = True
    _ == _ = False
    -}
    --------------------
    instance Show Monster where
        show (Faey) = "*Jingle*"
        show (Elemental) = "*Cracking noises*"
        show (Dragon) = "Arrw"    
    --------------------
    data Familiar = Nota Monster String Int String
    --------------------
    instance Show Familiar where
        show (Nota monster name hp owner) = (show monster) ++ " My name is: " ++ name ++ " my health point is at: " ++ show hp++ " and my master is: " ++ owner
    --------------------
    instance Eq Familiar where
        (Nota m1 n1 _ o1) == (Nota m2 n2 _ o2) = m1 == m2 && n1 == n2 && o1 == o2
    --------------------
    instance Ord Familiar where
        compare (Nota _ _ hp1 _) (Nota _ _ hp2 _) = compare hp1 hp2
    --------------------
    data Action = Attack Int 
                | Heal Int
                | Defend
                deriving(Eq)
    --------------------
    healtier :: Familiar -> Familiar -> Maybe Familiar
    healtier f1@(Nota m1 n1 hp1 o1) f2@(Nota m2 n2 hp2 o2)
        | hp1 > hp2 = Just f1
        | hp2 > hp1 = Just f2
        | otherwise = Nothing
    --------------------
    changeHealt :: Familiar -> Int -> Familiar
    changeHealt (Nota m n hp o) newHp = Nota m n newHp o
    --------------------
    -- Helper functions for play
    runAction :: Action -> Familiar -> Bool -> Familiar
    runAction (Attack d) monster@(Nota m n hp o) False = changeHealt monster (hp - d)
    runAction (Attack d) monster@(Nota m n hp o) True = changeHealt monster (hp - (div d 2))
    runAction (Heal h) monster@(Nota m n hp o) _= changeHealt monster (hp + h)
    runAction (Defend) monster _ = monster
    --------------------  
    getEither :: Either Action Action -> Action
    getEither (Left a) = a
    getEither (Right a) = a
    --------------------
    isLeft :: Either Action Action -> Bool
    isLeft (Left a) = True
    isLeft _ = False
    --------------------
    isHeal :: Action -> Bool
    isHeal (Heal x) = True
    isHeal _ = False
    --------------------
    getTuple :: ((Familiar, Familiar), Action, Action) -> (Familiar, Familiar)
    getTuple ((f1,f2), _, _) = (f1,f2)
    --------------------
    play :: (Familiar, Familiar) -> [Either Action Action] -> (Familiar, Familiar)
    play (f1, f2) actions = getTuple (foldr (playWithAcc) ((f1, f2), (Attack 0), (Attack 0)) actions)
        where
            playWithAcc ::  Either Action Action -> ((Familiar, Familiar), Action, Action) -> ((Familiar, Familiar), Action, Action)
            playWithAcc x ((f1, f2), lAcc, rAcc)
                | isLeft x && rAcc == Defend = ((f1, runAction (getEither x) f2 True), (getEither x), rAcc)
                | not (isLeft x) && lAcc == Defend = ((runAction (getEither x) f1 True, f2), lAcc, (getEither x))
                | isLeft x && isHeal (getEither x) = ((runAction (getEither x) f1 False, f2), (getEither x), rAcc)
                | not (isLeft x) && isHeal (getEither x) = ((f1, runAction (getEither x) f2 False), (getEither x), rAcc)
                | isLeft x = ((f1, runAction (getEither x) f2 False), (getEither x), rAcc)
                | not (isLeft x) = ((runAction (getEither x) f1 False, f2), lAcc, (getEither x))
    --------------------
    challenge :: Familiar -> Familiar -> [Either Action Action] -> Maybe Familiar
    challenge nota nota2 actions = healtier fisrt second
      where
         (fisrt, second) = play (nota, nota2) actions
    --------------------
    favourite :: Familiar
    favourite = Nota Dragon "Alexstrasza"  139450000 "Sennthx"
    --------------------