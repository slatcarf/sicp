(define (squares nums)
  (if (empty? nums)
    '()
    (sentence (square (first nums)) (squares (bf nums)))))

(define (square x)
  (* x x))

(squares '(1 2 3 4 5))
