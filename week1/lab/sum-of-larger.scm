
(define (square x) (* x x))

(define (square-sum x y) (+ (square x) (square y)))

(define (max x y) 
  (if (> x y) x y))

(define (two-big a b c)
  (if (> a b)
    (square-sum a (max b c))
    (square-sum b (max a c))))

;(define (sum-of-larger a b c)
;  (define first (if (> a b) a b))
;  (define out (if (< a b) a b))
;  (define second (if (> out c) out c))
;  (square-sum first second)


