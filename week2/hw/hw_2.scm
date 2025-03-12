(define (fevery f sen)
    (if (empty? sen)
        '()
        (se (f (first sen)) (every f (bf sen)))))

(define (sqaure x) (* x x))