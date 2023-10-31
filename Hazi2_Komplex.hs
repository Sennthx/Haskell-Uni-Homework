module Hazi2 where
   addC::(Double, Double) -> (Double, Double) -> (Double, Double)
   addC (a, b) (c, d) = (a+c,b+d)

   subC::(Double, Double) -> (Double, Double) -> (Double, Double)
   subC (a, b) (c, d) = (a-c,b-d)

   mulRC :: Double -> (Double,Double) -> (Double,Double)
   mulRC x (a, b) = (x*a, x*b)

   conjC :: (Double,Double) -> (Double,Double)
   conjC (a, b) = (a, -1*b)

   mulC :: (Double,Double) -> (Double,Double) -> (Double,Double)
   mulC (a, b) (c, d) = (a*c+(-1)*(b*d), a*d+b*c)