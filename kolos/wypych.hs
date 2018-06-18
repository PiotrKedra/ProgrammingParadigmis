import Data.List (sortBy)
import Text.Read (readMaybe) 
import Data.Maybe
import Data.Char
import Data.Map (Map)
import qualified Data.Map

--1
--2 dodac instanjce klasy Show
--3 dodac instancje klasy Eq
data Student = Student {id :: Int, name :: String, 
dateOfBirth :: String} deriving (Show,Eq)

data Score = Score {studentId :: Int, course1Score :: Int,
course2Score :: Int, course3Score :: Int} deriving (Show,Eq)

data StudentWithScores = SWS Int String String Int Int Int deriving (Show,Eq)

{- rozwiazanie do pierwszego
  I.  Nie podawać nazw
  II. Zmienić je na jakieś inne np. dodając prefix lub sufix
  II. Prznieść definicje do innego modułu
-}

--4
students :: [Student]
students = [Student 26453 "Kristalee Copperwaite" "2000", Student 33596 "Roeberta Naden" "1997",Student 26453 "Kristalee Copperwaite" "2004",Student 26453 "Kristalee Copperwaite" "20"]

scores :: [Score]
scores = [Score 26453 93 97 80, Score 40241 93 97 80, Score 33596 82 60 80]


--readMaybe date1 :: Maybe Int ze stringa zamienia na to na inta zebysmy mogli compare
sortByBirthsday:: [Student]->[Student]
sortByBirthsday = sortBy cmp where cmp (Student _ _ date1) (Student _ _ date2) = compare (readMaybe date1 :: Maybe Int) (readMaybe date2 :: Maybe Int)

sortByName:: [Student]->[Student]
sortByName = sortBy cmp where cmp (Student _ name _) (Student _ name2 _) = compare name2 name

sortByScore :: [Score] -> [Score]

{-
sortByScore:: [Score]->[Score]
sortByScore = sortBy cmp where cmp (Score id a _ _) (Score id2 b _ _) = let e = compare a b in if e = EQ then compare id id2 else e
nie wiem czemu to moje nie dziala
-}
sortByScore = sortBy cmp where cmp a b = let w = compare (course1Score a) (course1Score b) in if w == EQ then compare (studentId a) (studentId b) else w

summ:: Score -> Int
summ (Score _ a b c) = a+b+c

sortBy3Score:: [Score]->[Score]
sortBy3Score = sortBy cmp where cmp a b = compare (summ b) (summ a)

--5
toStudentWithScores:: Student->Score->Maybe StudentWithScores
toStudentWithScores (Student id name date) (Score id2 s1 s2 s3) = if id /= id2 then Nothing else Just $ SWS id name date s1 s2 s3
--6

findById :: [Score] -> Int -> [Score]
findById score id = filter (\s -> studentId s == id) score

--7 filter
findBy :: (Score -> Bool) -> [Score] -> [Score]
findBy f scrs = filter f scrs

--8 map mapBy:: (Score->a)->[Score]->[a]   <- tak raczej bardziej ogólnie
mapBy:: (Score->Score)->[Score]->[Score]
mapBy f scrs = map f scrs

--9 foldl
reduceBy::([a]->Score->[a])->[Score]->[a]
reduceBy f scrs = foldl f [] scrs

--10 tego nie rozumiem zabardzo
mapToJoin :: Student -> [Score] -> [Maybe StudentWithScores]
mapToJoin s = map (toStudentWithScores s)

--11 tego tez
joinStep1 :: [Student] -> [Score] -> [(Student, [Score])]
joinStep1 st sc = map (\s -> (s,findById sc $ Main.id s)) st

--12 ...
joinStep2 :: [(Student, [Score])] -> [[Maybe StudentWithScores]]
joinStep2 = map (\(s,sc) -> map (toStudentWithScores s) sc) 

--13 ....
joinStep3 :: [[Maybe StudentWithScores]] -> [StudentWithScores]
joinStep3 = foldr (\s scc -> (map (\(Just a) -> a) $ filter isJust s) ++ scc) []

--14
join :: [Student] -> [Score] -> [StudentWithScores]
join s sc = joinStep3 $ joinStep2 $ joinStep1 s sc

--15
class (Ord a) => Id a where toInt :: a -> Int

--16 to tez srednio
class  HasId a where getId:: (Id b)=> a b -> b

--17
--18
--19

--20
main ::IO()
main = do 
name <- getLine
putStrLn $ map toUpper name ++ " hello"
putStrLn $ "goodbye " ++ reverse name
