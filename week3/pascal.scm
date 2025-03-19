(define (pascal row col)
  (cond ((= col 0) 1) ((= col row) 1)
    (else
      (+
        (pascal (- row 1) (- col 1))
        (pascal (- row 1) col)))))


; Here every row is only computed once.

(define (new-pascal row col)
  (nth col (pascal-row row)))

(define (pascal-row row-num)
  (define (iter in out)
    (if (empty? (bf in)) out
      (iter (bf in)
        (se
          (+ (first in) (first (bf in))) out))))
  (define
    (next-row old-row num)
    (if (= num 0) old-row
      (next-row
        (se 1 (iter old-row '(1))) (- num 1))))
  (next-row '(1) row-num))

(define (upto n)
  (define (helper count)
    (cond ((< count 0) 1)
      (else (helper (- count 1))
        (printrow (pascal-row count) (- n count))))) (helper n))

(define (printrow row n)
  (cond
    ((< n 1) (println row))
    (else (write '_)
      (printrow row (- n 1)))))
(upto 10)

(print (pascal-row 0))
