; For each of the following expressions, what must f be in order for the evaluation of the expression to
; succeed, without causing an error? For each expression, give a definition of f such that evaluating the
; expression will not cause an error, and say what the expression’s value will be, given your definition. 


f 
(f)
(f 3)
((f))
(((f)) 3)

; Solution:
(define (f x) (+ x 1)) ; any will do
(define (f) 5) ; mustn't have arguments
(define (f x) (+ x 2)) ; must have one numeric argument
(define (f) ((lambda) () 5)) ; mustn't have arguments, must return a procedure that does not have arguments
(define (f) (lambda () (lambda (x) (+ x 1)))) ; mustn't have arguments, must return a function without
; arguments that returns a function with one numerical argument.
