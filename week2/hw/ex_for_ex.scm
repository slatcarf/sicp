(define (fact n)
    (if (= n 1)
        n
        (* n (fact (- n 1)))))

; How to create `fact` only with lambda?
; I had to look up the solution unfortunately. This is how to do it:

(((lambda (x) (x x))
    (lambda (fact)
        (lambda (n) 
            (if (= n 1)
                n
                (* n ((fact fact)(- n 1))))))))
