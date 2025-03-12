; Find the values of the expressions

; where 1+ is a primitive procedure that adds 1 to its argument, and t is defined as follows:
 (define (t f)
 (lambda (x) (f (f (f x)))) )
; Work this out yourself before you try it on the computer!

 ((t add1) 0) ; Guess: 3, Correct
 ((t (t add1)) 0) ; Guess: 9, Correct
 (((t t) add1) 0) ; Guess 9, Wrong Actual: 27

; Not really, since scheme uses app. order. but easier to visualize this way
 (t t) --> 
 ((lambda (f) 
    (lambda (x) 
        (f (f (f x)))
    )) t)
; So, the innermost call will return a function that applies f 2 times
; to the result of the prev. call of f
; Then, the next outer call will return a function, that applies said function 
; 2 times to the result of the previous call of the same function. That means it got 
; called 9 times now in total. 
; Same thing happens again, so add1 gets called 27 times