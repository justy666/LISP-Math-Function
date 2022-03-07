Justin Shen
CSC173
Project 3
jshen37@u.rochester.edu
Collaborators: Chris Chen (schen133@u.rochester.edu), Jeffrey li(jli167@u.rochester.edu)


Build/Running instruction:
	1. cd to the location of the file
	2. The file PRO_3.lisp is the file name of the program
	3. (load “PRO_3”)


Testing instruction:
	1. Once the program is load successfully, it will print out the sample output of each functions (same us the sample output in project description), 
	2. and then automatically start REPL function after that. 
	3. In the REPL function, the function will first ask you to input the name of function you want to test. If the name of function matched, enter
	the arguement. 
	4. Any invalid input argument will cause an error and halt the program. You will need to do (load “PRO_3”) again.
	
	
Sample output (Use "merge", "union", "factorial", "tritri" as example:):
----
----CSC173 Computation and Formal Systems
----Project 3
----Justin Shen, Chris Chen, Jeffrey Li
----

----List Functions----
(APPEND (1 3 x a) (4 2 b)) => (1 3 X A 4 2 B)
(REVERSE (A B C D)) => (D C B A)
(MAP ADD3 (1 2 3 4)) => (4 5 6 7)
(NUB (1 1 2 4 1 2 5)) => (1 2 4 5)
(MERGE (1 3 4 7) (2 3 6)) => (1 2 3 3 4 6 7)
(INDEXOF A (B C A D)) => 2
(INDEXOF A (B C D F)) => -1
(REMOVE-ALL A (B A C A A D A)) => (B C D)

----Set Functions----
(MEMBER A (B C A D)) => T
(INSERT A (B C D)) => (A B C D)
(INSERT A (A B C D)) => (A B C D)
(UNION (A B C) (A C D)) => (B A C D)
(DIFFERENCE (A B C) (A C D)) => (B)
(DIFFERENCE (A C D) (A B C)) => (D)
(SYMDIFF (A B C) (A C D)) => (B D)
(SUBSETP (A B) (A B C D)) => T
(SUBSETP (A B Q) (A B C D)) => NIL

----Math Functions----
(ABS 7) =>  7
(ABS -7) =>  7
(factorial 5) =>  120
(gcd 8 12) =>  4
(lcm 4 6) => 12
(nth-fibo 6) => 8
(nth-fibo 10) => 55

----Required Functions----
(TRI 3) => 55
(TRIP 55) => T
(TRITRI 18) => T
(TRITRI 14) => NIL

---------Entering REPL function--------

Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit)
merge
Enter the argument MERGE
Example of valid input: ((1 3 4 7) (2 3 6))
((1 3 5 8) (1 3 9))
MERGE ((1 3 5 8) (1 3 9)) => (1 1 3 3 5 8 9)
Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit)
union
Enter the argument UNION
Example of valid input: ((a c d) (a b c))
((a h f r e) (a f t y r e))
UNION ((A H F R E) (A F T Y R E)) => (H A F T Y R E)
Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit)
factorial
Enter the argument FACTORIAL
Example of valid input: 5
10
FACTORIAL 10 => 3628800
Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit)
tritri
Enter the argument TRITRI
Example of valid input: 18
14
TRITRI 14 => NIL
Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit)


Functions we implemented (21 in total):
append
reverse
map
nub
merge
indexof
remove-all
member
insert
union
difference
symdiff
subsetp
abs
factorial
gcd
lcm
nth-fibo
tri
trip
tritri





