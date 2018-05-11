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