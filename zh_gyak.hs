module ZH where

    import Data.Char

    isNothing :: Maybe a -> Bool
    isNothing Nothing = True
    isNothing _ = False

    unWrapJust :: Maybe a -> a
    unWrapJust (Just a) = a 

    modify :: (a -> Maybe a) -> [a] -> [a]
    modify f1 [] = []
    modify f1 (x:xs)
        | isNothing maybe = xs
        | not (isNothing maybe) = (unWrapJust maybe) : xs
        where
            maybe = f1 x

    csinalokValamitAparameterrelTrust :: a -> String
    csinalokValamitAparameterrelTrust x = "Hupsz megse csinaltam vele semmit xdASD"