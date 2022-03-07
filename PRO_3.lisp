(setq ext:*warn-on-redefinition* nil)
;;;;;;;;;;;;;;;List Function;;;;;;;;;;;;;;;;

;;FUNCTION Append two lists
(defun append(a b)
	(cond
		((eq a nil) b)
		(t (cons(car a) (append (cdr a) b))))
)

;;FUNCTION Reverse
(defun reverse (a)
	(reverseS a '()))
	
(defun reverseS (input out)
	(cond
		((equal (car input) nil) out)
		(t (reverseS (cdr input) (cons (car input) out)))))
		
(defun add3 (x)
	(+ 3 x))
;;FUNCTION map
(defun map (function n)
	(mapSub function (reverse n) '()))

(defun mapSub (function num output)
	(cond
		((equal (car num) nil) output)
		(t (mapSub function (cdr num) (cons (funcall function (car num)) output)))))
		
;;FUNCTION Remove duplicates from a list
(defun nub(inlist)
	(reverse (nubS inlist '())))
	
(defun nubS(inlist outlist)
	(cond
		((equal (car inlist) nil) outlist)
		((not (member (car inlist) outlist)) (nubS (cdr inlist) (cons (car inlist) outlist)))
		(t (nubS (cdr inlist) outlist))))
		
;;FUNCTION Merge two sorted lists
(defun merge (l1 l2)
	(reverse (mergeS l1 l2 '())))

(defun mergeS (l1 l2 output)
	(cond
		((equal (car l1) nil) (append (reverse l2) output))
		((equal (car l2) nil) (append (reverse l1) output))
		((<= (car l1) (car l2)) (mergeS (cdr l1) l2 (cons (car l1) output)))
		( t (mergeS l1 (cdr l2) (cons (car l2) output)))))

;;FUNCTION Index of 
(defun indexof (a l1)
	(compindex a l1 0))

;;Compute index
(defun compindex (a l1 x)
	(cond
		((equal (car l1) nil) -1)
		((equal a (car l1)) x)
		(t (compindex a (cdr l1) (+ x 1)))))
		
;;FUNCTION Remove-all
(defun remove-all (a b)
	(reverse(removed a b '())))

(defun removed (a ori new)
	(cond
		((equal (car ori) nil) new)
		((equal (car ori) a) (removed a (cdr ori) new))
		(t (removed a (cdr ori) (cons (car ori) new)))))
		
;;;;;;;;;;;;;;;Set Function;;;;;;;;;;;;;;;;

;;FUNCTION Set Membership
(defun member (tar list1)
  (cond
    ((equal (car list1) nil) (= 1 2))
    ((equal (car list1) tar) (= 1 1))
    (t (member tar (cdr list1)))))
	
;;FUNCTION Insert element into set
(defun insert (tar list1)
  (cond
    ((member tar list1) list1)
    (t (cons tar list1))))

;;FUNCTION Set Union
(defun Union (l1 l2)
  (cond
    ((equal (car l1) nil) l2)
    ((member (car l1) l2) (Union (cdr l1) l2))
    (t (Union (cdr l1) (insert (car l1) l2)))))

;;FUNCTION Set Difference
(defun difference (l1 l2)
  (differenceS l1 l2 '()))

(defun differenceS (l1 l2 out)
  (cond
    ((equal (car l1) nil) out)
    ((member (car l1) l2) (differenceS (cdr l1) l2 out))
    (t (differenceS (cdr l1) l2 (insert (car l1) out)))))
	
;;Retrieve the element
(defun retrieve (l1 l2)
  (cond
    ((equal (car l1) nil) l2)
    (t (retrieve (cdr l1) (insert (car l1) l2)))))
	
;;FUNCTION Symmetric difference (disjunctive union)
(defun symdiff (l1 l2)
  (retrieve (differenceS l1 l2 '()) (differenceS l2 l1 '())))

;;FUNCTION Check if Subset or Equal
(defun subsetp (l1 l2)
  (cond
    ((equal (car l1) nil) t)
    ((not (member (car l1) l2)) nil)
    (t (subsetp (cdr l1) l2))))
	
;;;;;;;;;;;;;;;Math Function;;;;;;;;;;;;;;;;

;FUNCTION Absolute Value
(defun abs (x)
	(cond 
	 ((< 0 x) x)
	 ((> 0 x) (- x))
	 ((= 0 x) 0))
)

;FUNCTION Factorial
(defun factorial (x)
  (if (= x 1) 1 (* x (factorial (- x 1)))) 
)
;FUNCTION GCD
(defun gcd (x y)
  (cond
    ((= x y) x)
    ((< x y) (gcd x (- y x)))
    (t (gcd y (- x y)) ))
)
;FUNCTION LCM
(defun lcm (x y)
(/ (abs(* x y)) (gcd x y))
)

;FUNCTION Fibonacci
(defun nth-fibo (n)
  (cond
    ((<= n 2) 1)
  (t (+ (nth-fibo (- n 1)) (nth-fibo (- n 2))))))
  
;;;;;;;;;;;;;;;Required Function;;;;;;;;;;;;;;;;

;;FUNCTION Nth triangular number
(defun tri (N)
     (if (= N 0) 0 (+ N (tri (- N 1))))
	 )
;;FUNCTION Test whether a given number is a triangular number.
(defun trip (N)
	(tripS N 1)
	)

(defun tripS (N count)
  (cond
	((= N 0) t)
	((< N 0) nil)
	(t (tripS (- N count) (+ count 1))))
	)
	
;;generate list of triangular number less than n
(defun triList(n)
    (triListS 0 0 n)
)

(defun triListS(count I J) 
(if (> I J) nil
(if (= I J) (list I)
(cons I (triListS (+ 1 count) (tri (+ 1 count)) J)))))

(defun checktri(list number) (if (null list)
nil (cons (- number (car list)) (checktri (cdr list) number))))

;;test whether a list contain triangular number
(defun triangleout (L)
  (if (null L)
      nil
    (if (trip (car L))
        (car L)
      (triangleout (cdr L)))))
;;FUNCTION whether a given number is the sum of two triangular numbers
(defun tritri (num) (if (eq nil (triangleout (checktri (triList num) num))
)nil T))
	
(format t "----~%")
(format t "----CSC173 Computation and Formal Systems~%")
(format t "----Project 3~%")
(format t "----Justin Shen, Chris Chen, Jeffrey Li~%")
(format t "----~%~%")

(format t "----List Functions----~%")
(format t "(APPEND (1 3 x a) (4 2 b)) => ~a~%" (append '(1 3 x a) '(4 2 b)))
(format t "(REVERSE (A B C D)) => ~S~%" (reverse '(a b c d)))
(format t "(MAP ADD3 (1 2 3 4)) => ~S~%" (map 'add3 '(1 2 3 4)))
(format t "(NUB (1 1 2 4 1 2 5)) => ~A~%" (nub '(1 1 2 4 1 2 5)))
(format t "(MERGE (1 3 4 7) (2 3 6)) => ~A~%" (merge '(1 3 4 7) '(2 3 6)))
(format t "(INDEXOF A (B C A D)) => ~A~%" (indexof 'a '(b c a d)))
(format t "(INDEXOF A (B C D F)) => ~A~%" (indexof 'a '(b c d f)))
(format t "(REMOVE-ALL A (B A C A A D A)) => ~A~%~%" (remove-all 'a '(b a c a a d a)))

(format t "----Set Functions----~%")
(format t "(MEMBER A (B C A D)) => ~A~%" (member 'a '(b c a d)))
(format t "(INSERT A (B C D)) => ~A~%" (insert 'a '(b c d)))
(format t "(INSERT A (A B C D)) => ~A~%" (insert 'a '(a b c d)))
(format t "(UNION (A B C) (A C D)) => ~A~%" (union '(a b c) '(a c d)))
(format t "(DIFFERENCE (A B C) (A C D)) => ~A~%" (difference '(a b c) '(a c d)))
(format t "(DIFFERENCE (A C D) (A B C)) => ~A~%" (difference '(a c d) '(a b c)))
(format t "(SYMDIFF (A B C) (A C D)) => ~A~%" (symdiff '(a b c) '(a c d)))
(format t "(SUBSETP (A B) (A B C D)) => ~A~%" (subsetp '(a b) '(a b c d)))
(format t "(SUBSETP (A B Q) (A B C D)) => ~A~%~%" (subsetp '(a b q) '(a b c d)))

(format t "----Math Functions---- ~%")
(Format t "(ABS 7) =>  ~S~%" (abs 7)  )
(Format t "(ABS -7) =>  ~S~%" (abs -7) )
(Format t "(factorial 5) =>  ~D~%" (factorial 5) )
(Format t "(gcd 8 12) =>  ~D~%" (gcd 8 12) )
(Format t "(lcm 4 6) => ~D~%" (lcm 4 6) )
(Format t "(nth-fibo 6) => ~D~%" (nth-fibo 6) )
(Format t "(nth-fibo 10) => ~D~%~%" (nth-fibo 10) )

(format t "----Required Functions----~%")
(format t "(TRI 3) => ~A~%" (tri 10))
(format t "(TRIP 55) => ~A~%" (trip 55))
(format t "(TRITRI 18) => ~S~%" (tritri 18))
(format t "(TRITRI 14) => ~S~%~%" (tritri 14))

(format t "---------Entering REPL function--------~%~%")


(defun repl ()
	(format t "Enter the name of the function you want to test, EX: enter append for APPEND. (enter quit to quit) ~%")
	(setq arg (read))
	(cond
		((equal arg 'quit)
			(format t "program ends"))
		((equal arg 'append)
		 	(progn
				(format t "Enter the argument ~a~%Example of valid input: ((1 3 X A) (4 2 B))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (append (car input) (cadr input))))
				(repl))
		((equal arg 'reverse)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (A B C D)~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (reverse input)))
				(repl))
		((equal arg 'map)
			(progn
				(format t "Enter the argument for the function ~a~%a valid input is (add3 (1 2 3 4))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (map (car input) (cadr input))))
				(repl))
		((equal arg 'nub)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (1 1 2 4 1 2 5)~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (nub input))
				(repl)))
		((equal arg 'merge)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: ((1 3 4 7) (2 3 6))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (merge (car input) (cadr input)))
				(repl)))
		((equal arg 'indexof)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (a (a b c d))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (indexof (car input) (cadr input)))
				(repl)))
		((equal arg 'remove-all)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (a (a b c d e a a))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (remove-all (car input) (cadr input)))
				(repl)))
		((equal arg 'member)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (a (b c a d))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (member (car input) (cadr input)))
				(repl)))
		((equal arg 'insert)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (d (a b c))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (insert (car input) (cadr input)))
				(repl)))
		((equal arg 'union)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: ((a c d) (a b c))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (union (car input) (cadr input)))
				(repl)))
		((equal arg 'difference)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: ((a c d) (a b c))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (difference (car input) (cadr input)))
				(repl)))
		((equal arg 'symdiff)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: ((a c d) (a b c))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (symdiff (car input) (cadr input)))
				(repl)))
		((equal arg 'subsetp)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: ((a c d) (a b c))~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (subsetp (car input) (cadr input)))
				(repl)))
		((equal arg 'abs)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 7~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (abs input))
				(repl)))
		((equal arg 'factorial)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 5~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (factorial input))
				(repl)))
		((equal arg 'gcd)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (4 6)~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (gcd (car input) (cadr input)))
				(repl)))
		((equal arg 'lcm)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: (8 12)~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (lcm (car input) (cadr input))))
				(repl))
		((equal arg 'factorial)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 5~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (factorial input))
				(repl)))
		((equal arg 'nth-fibo)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 1~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (nth-fibo input))
				(repl)))
		((equal arg 'tri)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 3~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (tri input))
				(repl)))
				
		((equal arg 'trip)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 55~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (trip input))
				(repl)))
		((equal arg 'tritri)
			(progn
				(format t "Enter the argument ~a~%Example of valid input: 18~%" arg)
				(setq input (read))
				(format t "~a ~a => ~a ~%" arg input (tritri input))
				(repl)))
		(t (format t "There is no function ~a, check if the spelling is correct or not~%" arg) 
			(repl))
	)
)


(repl)