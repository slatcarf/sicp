(define (substitute sen old new)
    (if (empty? sen)
        '()
        (se (if (eq? (first sen) old)
                new
                (first sen)) 
            (substitute (bf sen) old new))))