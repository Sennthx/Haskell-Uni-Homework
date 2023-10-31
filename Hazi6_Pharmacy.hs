module Pharmacy where

   newtype Ingredient = Ingredient [(Element, Effect)]

   data Potion = Bottle
               | Potion Int Element Effect Potion

   data Element = Aqua
                | Ignis
                | Aer
                | Terra
                | Lux
                | Noctum

   data Effect = Resistance
               | Boost
               | Damage
               | Debuf

   toEnglish ::  Element -> String
   toEnglish Aqua = "Water"
   toEnglish Ignis = "Fire"
   toEnglish Aer = "Air"
   toEnglish Terra = "Earth"
   toEnglish Lux = "Light"
   toEnglish Noctum = "Darkness"

   toPhrase :: Effect -> String
   toPhrase Resistance = "Resistance"
   toPhrase Boost = "Boost"
   toPhrase Damage = "Damage"
   toPhrase Debuf = "Debuf"

   refine :: (Element, Effect) -> Potion -> Potion
   refine ee p1 = needsNorm (addElement ee p1)
      where
         addElement :: (Element, Effect) -> Potion -> Potion
         addElement (el,ef) Bottle = Potion 50 el ef Bottle
         addElement elef@(el,ef) (Potion power ell eff p2)
            | elefCheck elef (ell,eff) = Potion (power+50) el ef p2
            | otherwise = (Potion power ell eff (addElement elef p2))

         elefCheck :: (Element, Effect) -> (Element, Effect) -> Bool
         elefCheck (el,ef) (ell,eff)
            | toEnglish(el) == toEnglish(ell) && toPhrase(ef) == toPhrase(eff) = True
            | otherwise = False

         nPotion = addElement ee p1

         checkSum :: Integral a => Potion -> a
         checkSum p@(Potion power _ _ Bottle) = fromIntegral(power) + 0
         checkSum p@(Potion power _ _ p2) = fromIntegral(power) + checkSum (p2)

         normalize :: Potion -> Potion
         normalize p@(Potion power el ef Bottle) = Potion (norm power) el ef Bottle
         normalize p@(Potion power el ef p2) = Potion (norm power) el ef (normalize p2)

         needsNorm :: Potion -> Potion
         needsNorm p@(Potion power el ef p2)
            | checkSum p > 1000 = normalize p
            | checkSum p <= 1000 = p

         norm :: Integral a => a -> Int
         norm power = floor(((1000.0 / fromIntegral(checkSum nPotion))*fromIntegral(power)))  

   brew :: Ingredient -> Potion -> Potion
   brew (Ingredient []) p = p
   brew (Ingredient (x:xs)) p = brew (Ingredient xs) (refine x p)

   nameOf :: Potion -> String
   nameOf p = writeString(helper p p)
      where
         helper :: Potion -> Potion -> Potion
         helper (Bottle) acc = acc
         helper p@(Potion power _ _ Bottle) acc@(Potion power2 _ _ _)
            | power >= power2 = p
            | power2 >= power = acc
         helper p@(Potion power _ _ potiNext) acc@(Potion power2 _ _ _)
            | power >= power2 = helper potiNext p
            | power2 >= power = helper potiNext acc
         
         writeString :: Potion -> String
         writeString (Bottle) = "Bottle"
         writeString (Potion _ el ef _) = "Potion of "++(toEnglish el)++" "++(toPhrase ef)

   brewOn :: [Ingredient] -> Potion -> Potion
   brewOn [] acc = acc
   brewOn (ingredient:ingredients) p = brewOn ingredients (brew ingredient p) 

   pharmacy :: [Ingredient] -> String
   pharmacy ls = named (brewOn ls Bottle) 
      where
         brewOn :: [Ingredient] -> Potion -> Potion
         brewOn [] acc = acc
         brewOn (ingredient:ingredients) p = brewOn ingredients (brew ingredient p) 
         
         named :: Potion -> String
         named b@(Potion _ Aqua Resistance (Potion a Aer Boost (Potion n Noctum Damage Bottle)))
            | n - a == 100 && nameOf b == "Potion of Water Resistance" = "Cold brew"
            
         named (Potion f Ignis Damage (Potion l Lux Damage (Potion e Terra Boost (Potion ed Terra Damage (Potion i Ignis Resistance Bottle)))))
            | abs (i - f) <= 187 && f + l + ed > 300 && e + i >= 400 = "Dwarven spirit"
            
         named (Potion nd Noctum Debuf (Potion nr Noctum Resistance (Potion _ Ignis Debuf (Potion l Lux Boost (Potion t Terra Boost (Potion a Aer Boost Bottle)))))) 
            | nd == nr && (l * t * a) `div` 1000 >= 864 && (l * t * a) `div` 1000 < 960 = "Astra's favourite"
            
         named (Potion n Noctum Damage (Potion l Lux Damage (Potion i Ignis Damage (Potion t Terra Damage (Potion a Aqua Damage (Potion ae Aer Boost Bottle)))))) 
            | n + l + i + t + a + ae == 1000 = "Spicy tonic"

   {-
      Noctum Debuf == distil(pyrolysis(moonflowerPetal))
      Noctum Resistance = distil(pyrolysis((pyrolysis(moonflowerPetal))))
      Ignis Debuf == [(distil(pyrolysis(syrensScale)))]

      Lux Boost == [(distil (lumarFeather))]
      Terra Boost == [(distil (flowerOfTheMotherTree))]
      Aer Boost == [(distil (pyrolysis (lumarFeather)))]
   -}

   potion1 = [(distil (syrensScale))] ++ [(distil (syrensScale))] ++ [(distil (syrensScale))] ++ [(distil (syrensScale))] ++ [(distil (syrensScale))] ++ [(distil (pyrolysis lumarFeather))] ++ [(distil (pyrolysis lumarFeather))] ++ [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))]

   potion2 = [(distil (liquidFlame))] ++ [(distil (liquidFlame))] ++ [wispEssence] ++ [wispEssence] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [distil (pyrolysis (obsidian))] ++ [distil (pyrolysis (obsidian))] ++ [distil (pyrolysis (obsidian))] ++ [distil (pyrolysis (obsidian))]

   potion3 = [(distil (pyrolysis(moonflowerPetal)))] ++ [(distil (pyrolysis((pyrolysis(moonflowerPetal)))))] ++ [(distil (pyrolysis(syrensScale)))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (lumarFeather))] ++ [(distil (flowerOfTheMotherTree))] ++ [(distil (pyrolysis (lumarFeather)))]

   potion4 = [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))] ++ [(distil (moonflowerPetal))] ++ [(wispEssence)] ++ [(wispEssence)] ++ [(wispEssence)] ++ [(wispEssence)] ++ [(distil (liquidFlame))] ++ [(distil (liquidFlame))] ++ [(distil (liquidFlame))] ++ [(distil (liquidFlame))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [(distil (obsidian))] ++ [(distil (pyrolysis(liquidFlame)))] ++ [(distil (pyrolysis(liquidFlame)))] ++ [(distil (pyrolysis(lumarFeather)))] ++ [(distil (pyrolysis(lumarFeather)))]

   distil :: Ingredient -> Ingredient
   distil (Ingredient []) = Ingredient [] -- Ha üres akkor üres :D
   distil (Ingredient (i:_)) = Ingredient [i] -- Bármilyen hosszú Ingredient esetén mindig az elsőt adja vissza

   pyrolysis :: Ingredient -> Ingredient
   pyrolysis (Ingredient []) = Ingredient [] -- Ha üres akkor üres
   pyrolysis (Ingredient (_:is)) = Ingredient is  -- Bármilyen hosszú Ingredient esetén eldobja az elsőt 
            
   -- Constans függvények melyek vissza adják az adott Ingredient listákat
   lumarFeather, wispEssence, flowerOfTheMotherTree, moonflowerPetal, liquidFlame, syrensScale, obsidian :: Ingredient
   wispEssence = Ingredient [(Lux, Damage)] 
   lumarFeather = Ingredient [(Lux, Boost), (Aer, Boost), (Aer, Boost)]
   flowerOfTheMotherTree = Ingredient [(Terra, Boost), (Terra, Boost)]
   moonflowerPetal = Ingredient [(Noctum, Damage), (Noctum, Debuf), (Noctum, Resistance), (Noctum, Resistance), (Noctum, Damage)]
   liquidFlame = Ingredient [(Ignis, Damage), (Aqua, Damage), (Ignis, Damage)]
   syrensScale = Ingredient [(Aqua, Resistance), (Ignis, Debuf), (Ignis, Debuf), (Aqua, Resistance)]
   obsidian = Ingredient [(Terra, Damage), (Ignis, Resistance), (Terra, Damage), (Ignis, Resistance)]

   --testPossibleNums n = [l:t:a:[] | l <- [0..n], t <- [0..n], a <- [0..n], (l*t*a)  == 864000]

   --[[90,96,100],[90,100,96],[96,90,100],[96,100,90],[100,90,96],[100,96,90]]