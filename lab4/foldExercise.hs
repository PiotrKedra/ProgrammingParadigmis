class Domain a where id::a -> Int
instance Domain Student where id(Student i _) = i --is = sid
instance Domain Teacher where id(Teacher i _) = i

data Student = Student {sid::Int, sname::String}
data Teacher = Teacher {tid::Int, subject::String}
--map -> n wejsciowych danych i ne wyjsciowych
--fold -> n wejsciowych i jedna wyjsciowa( funkcja rediuce w pythonie)
--foldl i folfr


--duzo wyjasnione tutaj http://learnyouahaskell.com/higher-order-functions
fsum:: [Int] -> Int
fsum list = foldl (+) 0 list

fproduct:: [Int] -> Int
fproduct list = foldl (*) 1 list

freverse:: [Int] -> [Int]
freverse list = foldl (\acc b -> b : acc) [] list

fand:: [Bool] -> Bool
fand a = foldl (&&) True a

for:: [Bool] -> Bool
for a = foldl (||) False a

fhead:: [a] -> a
fhead list = foldr (\x _ -> x) undefined list

flast:: [a] -> a
flast list = foldl (\_ x -> x) undefined list

--liczenie wystapien wyrazow w liscie(moze na kolosie> xd) trza zrobic
--test git 2
