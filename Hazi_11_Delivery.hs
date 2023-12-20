module Delivery where
   ------------------
   data Node = Node Char deriving(Eq)
   data Edge = Edge Node Int Node deriving(Eq)
   data Path = Path [Edge]
   -----------------------
   instance Show Node where
      show (Node x) = show x
   -------------------------
   instance Show Edge where -- <node1>    ---      <number>      --->     <node2>
      show (Edge n1 num n2) = show n1 ++ "--- " ++ show num ++ " --->" ++ show n2
   ------------------------------------------------------------------------------
   instance Show Path where
      show (Path (x:xs)) = "[" ++ helper (x:xs) ++ "]"
         where
            helper :: [Edge] -> String
            helper [] = ""
            helper [x] = show x
            helper (x:xs) = show x ++ "," ++ helper xs
   ---------------------------------------------------
   -- 2. a)
   fromNode :: Edge -> Node
   fromNode (Edge (Node n1) _ _) = (Node n1)
   weight :: Edge -> Int
   weight (Edge _ num _) = num
   toNode :: Edge -> Node
   toNode (Edge _ _ (Node n2)) = (Node n2)
   ---------------------------------------
   -- 3.
   allPathsFrom :: [Edge] -> Node -> [Path]
   allPathsFrom [] _ = []
   allPathsFrom xs node = map (Path) (getPaths xs node (filter (startsWithNode node) xs) [])
      where
         startsWithNode :: Node -> Edge -> Bool
         startsWithNode node x
            | (fromNode x) == node = True
            | otherwise = False
         getPaths :: [Edge] -> Node -> [Edge] -> [Edge] -> [[Edge]]
         getPaths xs node [] acc = []
         getPaths xs node (a:as) acc
               | elem a acc = getPaths xs node as acc
               | otherwise = [acc ++ [a]] ++ getPaths xs (toNode a) (filter (startsWithNode (toNode a)) xs) (acc ++ [a]) ++ getPaths xs node as acc
   ------------------------------------------------------------------------------------------------------------------------------------------------------
   -- 4.
   shortestPath :: [Edge] -> Node -> Node -> Path
   shortestPath xs a b = getFastestPath (filter (getPathsFromAtoB) (allPathsFrom xs a))
       where
           getPathsFromAtoB :: Path -> Bool
           getPathsFromAtoB x
              | fromNode (head (getEdgeArr x)) == a && toNode (last (getEdgeArr x)) == b = True
              | otherwise = False
           getEdgeArr :: Path -> [Edge]
           getEdgeArr (Path xs) = xs
           getFastestPath :: [Path] -> Path
           getFastestPath (x:xs) = getFastestPath' (x:xs) x
              where
                 getFastestPath' :: [Path] -> Path -> Path
                 getFastestPath' [] pathAcc = pathAcc
                 getFastestPath' (x:xs) pathAcc
                    | (getSumOfPath (getEdgeArr x)) < (getSumOfPath (getEdgeArr pathAcc)) = getFastestPath' xs x
                    | otherwise = getFastestPath' xs pathAcc
                    where
                       getSumOfPath :: [Edge] -> Int
                       getSumOfPath [] = 0
                       getSumOfPath ((Edge n1 num n2):xs) = num + getSumOfPath xs
   ------------------------------------------------------------------------------
   -- Teszt
   --------
   t1,t2,t3,t4,t5,t6,t7 :: Node
   t1 = Node 'A'
   t2 = Node 'B'
   t3 = Node 'C'
   t4 = Node 'D'
   t5 = Node 'E'
   t6 = Node 'F'
   t7 = Node 'G'
   -------------
   p1 = Path [Edge t1 0 t1]
   ------------------------
   p = Path [Edge t1 (-5) t1, Edge t1 1 t2, Edge t2 3 t3, Edge t2 5 t5, Edge t3 1 t4, Edge t4 1 t5, Edge t7 3 t6, Edge t6 1 t7, Edge t6 2 t5]
   ---------------------------and [null . allPathsFrom [] . Node $ x | x <- ['A'..'z'] ]---------------------------------------------------------------------------------------------------------------