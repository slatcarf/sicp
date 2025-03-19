(define (fevery f sen)
  (if (empty? sen)
    '()
    (se (f (first sen)) (every f (bf sen)))))

(define (square x)
  (* x x))
