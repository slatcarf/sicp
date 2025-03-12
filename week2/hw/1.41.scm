(define (double f) 
    (lambda (x)
        (f (f x))))

(define (inc x)
    (+ x 1))

;What value is returned by 
(((double (double double)) inc) 5)
;?

; Answer: 9 -> wrong

 (double double) 
 ; -->
 (double (lambda (f) (lambda (x) (f (f x)))))
 ; -->
 (lambda (x) 
    ((lambda (f) (lambda (x) (f (f x)))) ((lambda (f) (lambda (x) (f (f x)))) x)))

; next step (double (double double))
; -->
(double (lambda (x) 
    ((lambda (f) (lambda (x) (f (f x)))) ((lambda (f) (lambda (x) (f (f x)))) x))))
; -->
(lambda (x) ((lambda (x) 
    ((lambda (f) (lambda (x) (f (f x)))) ((lambda (f) (lambda (x) (f (f x)))) x))) ((lambda (x) 
    ((lambda (f) (lambda (x) (f (f x)))) ((lambda (f) (lambda (x) (f (f x)))) x))) x)))

;  Correct answer is 21, ((double (double double)) inc) is a procedure that applies inc 16 times