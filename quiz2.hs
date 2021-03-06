
-- Martin Vadakara
-- Quiz 2

{-  Problem 1
Write the definition of a recursive function 'count9s' that given a non-negative Int n,
returns the count of the occurrences of 9 as a digit in n, so for example 997 yields 2.
Note that mod by 10 yields the rightmost digit (126 `mod` 10 is 6), while divide (div) by
10 removes the rightmost digit (126 `div` 10 is 12).

The function would work as follows:

      count9s 919      -- result: 2
      count9s 9        --         1
      count9s 123      --         0
-}
-- count9s1 :: Int

count9s :: Int -> Int
count9s 0 = 0
count9s n 
	| n == 0 = 0
	| n `mod` 10 == 9 = 1 + count9s (n `div` 10)
	-- | n == 9 = 1 + count9s(n `div` 10)
	| otherwise = count9s(n `div` 10)
	
			 

{-
Problem 2 - powerofN

Write the definition of a recursive function 'powerofN' that given a base and n that are
both 1 or more, returns the value of base to the n power, so powerofN(3, 4) is 81 (3 to
the power of 4).

 

The function would work as follows:

      powerofN 3 1      -- result: 3
      powerofN 3 2      --         9
      powerofN 3 3      --         27

-}
powerofN :: Integer -> Integer -> Integer
powerofN x y | y == 1 = x
			 | otherwise = x * (powerofN (x) (y-1)) 
			 
	

{-
(10 points)
Problem 3 - removeX

Write the definition of a recursive function 'removeX' that given a String, returns a new
String where all the 'x' chars (lower case x) have been removed.

      


The function would work as follows:

      removeX "xaxb"    -- result: "ab"
      removeX "abc"     --         "abc"
      removeX "xx"      --         ""
-}
 
removeX :: String -> String
removeX [] = []
removeX (x:xs) | x /= 'x' = x : removeX xs
			   | otherwise = removeX xs 
{-
(10 points)
Problem 4 - removeX'

Write a removeX' function definition (non-recursive) using a list comprehension. The
function must do the same thing as removeX from problem 3.
 

-}

 -- removeX' = [ x | x <- [""], x == "x"] 
removeX' str = [ch | ch <- str, ch/= 'x']
 

{-
(15 points)
Problem 5 - removeX''

Write a removeX'' function definition (non-recursive).  The function definition of
removeX'' must contain a call to 'filter' to filter out the 'x' chars. The removeX''
function must do the same thing as removeX and removeX'.

Recall that the 'filter' function takes a Bool function as the first argument. Your
removeX'' function may include a local function definition or lambda expression (See Week
4 notes) to use with filter.



-}

--removeX'' x = filter (\x -> x /= "x") [x]
		--		Chung's answers
-- removeX'' str = filter nox str 
  --				 where 
	--				 nox ch = ch /= 'x'
					 
			    -- longer: nox ch = if ch /= 'x' then True else False
	
-- use local function defintion using let..in
--removeX'' str = let nox ch = ch/= 'x'
	--			in filter nox str
				

--removeX'' str = filter (\ch -> ch /= 'x') str


{-
(10 points)
Problem 6 - dayAbbr

Say that you want to use the 'map' function to replace the Ints between 0 and 6 in a list
with corresponding String day abbreviations, where 0 -> "Sun", 1 -> "Mon", ..., 6 ->
"Sat". If an Int value in the list is not between 0 and 6, the corresponding String would
be "NA". The map would be used as follows:

   map dayAbbr [0,6,7,1,3,4,2,5,8]
   -- result: ["Sun","Sat","NA","Mon","Wed","Thu","Tue","Fri","NA"]

Write a working definition for the dayAbbr function below:

 

-}
dayAbbr :: Int -> String

dayAbbr 0 = "Sun"
dayAbbr 1 = "Mon"
dayAbbr 2 = "Tues"
dayAbbr 3 = "Wed"
dayAbbr 4 = "Thrus"
dayAbbr 5 = "Fri"
dayAbbr 6 = "Sat"
dayAbbr n = "NA"
--dayAbbr2 = ["Sun" , "Mon", "Tues", "Wed", "Thrus", "Fri", "Sat"]
--dayAbbr x | x == dayAbbr1 = dayAbbr2
	--	  | otherwise = ["NA"]
		  --Chung's answers

dayAbbr day 
| day >= 0 && day <= 6 = dayAbbreves !! day
| otherwise 			= "NA"
	where 
		dayAbbreves = ["Sun", "Mon", "Tues", "Wed", "Thrus", "Fri", "Sat"]
{-
(15 points)
Problem 7 - Lambda functions

a. You need to write a map that given a list of integers changes the sign of all negative
   integers in the list:

      map (lambda) [-1, 0, 5, -10, -20] -- result: [1,0,5,10,20]

   What lambda function can you substitute for (lambda)?
   (You can use the abs function in the lambda.)

   (\x ->  (abs x))

b. You need to write a filter to remove all empty Strings in a list of Strings. The filter
   would be used as follows:

      filter (lambda) ["1", "2", "", "4", "", "6"] -- result: ["1","2","4","6"]

   What lambda function can you substitute for (lambda)?
   (\x -> x /=(""))
	or 
	( \x ->  if x /= "" then True else False)

c. You need to write a map that given a list of lists, returns a list of the list maximums.

      map (lambda) [[1, 3], [2, 1, 5], [8, 7], [0], [-10, -1]] -- result: [3,5,8,0,-1]

   What lambda function can you substitute for (lambda)?
   (\x - > maximum [x])
   
   (\1st -> maximum 1st)

-}
