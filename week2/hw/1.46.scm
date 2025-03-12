(define (iterative-improve good-enough? improve)
    (define (improver guess)
        (if (good-enough? guess)
            guess
            (improver (improve guess))))
            improver)

(define (average x y)
    (/ (+ x y) 2.0))

(define (sqrt x)
    (define (guess-test? guess)
        (< (abs (- (* guess guess) x)) 0.001))
    (define (improve-guess guess)
        (average guess (/ x guess)))
    ((iterative-improve guess-test? improve-guess) 1))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? guess)
        (< (abs (- guess (f guess))) tolerance))
    (define (improve guess)
        (f guess))
    
    ((iterative-improve close-enough? improve) first-guess))