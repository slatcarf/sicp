(define (repeated f times)
    (if (< times 2)
        f 
        (composed f (repeated f (- times 1)))
        )
    )

(define (composed f g)
    (lambda (x) (f (g x))))