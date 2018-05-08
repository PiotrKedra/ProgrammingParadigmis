-- :t sprawdza typ czegos, tez funckji
-- np: :t 'x' :t succ

{-funckje robimy:
	nazwa_funkcji argumenty_funkjci = to co z nimi ma robic, i zwracac
	np: addTwo a = a+2
-}

--listy [] ten sam typ w srodku
--krotki () zbior jakich kolwiek elementow

incAndTriple v = ( v + 1 ) * 3

specialCases 1 = "Hello"
specialCases 2 = " "
specialCases 3 = "World"
specialCases 4 = "!"
specialCases x = "???"

--map incAndTriple 3 da nam 12 tak jak kazalismy to zrobic
--uzycie map specialCases [1..4] zrobi nam tablice string z pierwszymi stringami specialCases
--concat (map specialCases [1..4]) polaczy nam ta tablice w jeden String

--operacja infixowa 1 + 2
--operacja prefixowa (+) 1 2

--tak jak w prologu, ':' to konstruktor listy
getSecondElem (_:x:_) = x