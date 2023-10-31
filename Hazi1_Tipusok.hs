module Hazi1 where

   intE1::(Num a, Integral b) => String -> a -> a
   intE2::Int
   intE3::Int

   intE1 = 1
   intE2 = 2
   intE3 = 3

   charE1::Char
   charE2::Char
   charE3::Char

   charE1 = 'X'
   charE2 = 'Y'
   charE3 = 'Z'

   doubleE1::Double
   doubleE2::Double
   doubleE3::Double

   doubleE1 = pi
   doubleE2 = exp 1
   doubleE3 = sqrt 2
   
   stringE1::String
   stringE2::String
   stringE3::String

   stringE1 = "Konstans függvények: Olyan függvények, amiknek nincsen paramétere. Konstans az értékük, innen van a nevük."
   stringE2 = "Alaptípusok: Int, Bool, String, Double, Char"
   stringE3 = "Zserbó"

   inc::Int -> Int
   inc x = x + 1

   double::Int -> Int
   double x = x * 2

   agent1::Int
   agent1 = inc(inc(inc(double(double(inc 0)))))

   agent2::Int
   agent2 = inc(inc(inc(inc(inc(inc(inc 0))))))

   agent3::Int
   agent3 = inc(double(inc(inc(inc 0))))

   foo::Int -> Bool -> Bool
   foo x False = odd x
   foo x True = even x
   
   bar::Bool -> Int -> Bool
   bar True x = foo x True
   bar False x = foo x False
