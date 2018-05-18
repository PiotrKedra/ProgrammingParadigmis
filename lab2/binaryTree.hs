data Tree a = Node a (Tree a) (Tree a) | Null deriving(Show)
--u can test it like: testTree = Node 1 (Node 2 Null Null) Null

empty :: Tree a -> Bool
empty Null = True
empty _ = False

insert::(Ord a) => Tree a -> a -> Tree a
insert Null a = (Node a Null Null)
insert (Node a left right) b
    |a==b = (Node a (insert left b) right)
    |a>b = (Node a (insert left b) right)
    |a<b = (Node a left (insert right b))
--insert work but it work on copy not on reference, how to make it works on reference?
--wlasnie taki jest haskel

isBinary::(Ord a) => Tree a -> Bool
isBinary Null = True
isBinary (Node a Null Null) = True
isBinary (Node a (Node b Null Null) Null)
    |a>b = True
    |a==b = True
    |a<b = False
isBinary (Node a Null (Node b Null Null))
    |a<b = True
    |a==b = False
    |a>b = False
isBinary (Node a (Node b leftB rightB) Null)
    |a<b = False
    |otherwise = isBinary(Node b leftB rightB)
isBinary (Node a Null (Node c leftC rightC))
    |a>c = False
    |a==c = False
    |otherwise = isBinary(Node c leftC rightC)
isBinary (Node a (Node b leftB rightB) (Node c leftC rightC))--(Node b leftB rightB) not match Null? why>??
    |a<b = False
    |a>c = False
    |a==c = False
    |otherwise = (isBinary(Node b leftB rightB) && isBinary(Node c leftC rightC))

--tmap::Tree a ->(a->b)->Tree a
--tmap Null _ = Null

getLevel:: Tree a -> Int -> [a]
getLevel Null _ = []
getLevel (Node a left right) 1 = [a]
getLevel (Node a left right) level = getLevel left (pred level) ++ getLevel right (pred level)



dumpDOT:: Show a => Tree a -> String
dumpDOT Null = "_"
dumpDOT (Node a (Node b leftB rightB) (Node c leftC rightC)) = 
   show a ++ "->" ++ show b ++ "\n" ++ show a ++ "->" ++ show c ++ "\n" 
   ++ dumpDOT (Node b leftB rightB) ++ dumpDOT (Node c leftC rightC)


