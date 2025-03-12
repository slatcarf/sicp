(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (inc n)
    (+ n 1))

(define (identity n)
    n)
; How to define factorial in terms of product
(define (factorial n) 
    (product identity 1 inc n))

; Compute approximation of pi

(define (approx-pi a b)
   (* 4.0  (product (lambda (x)
                (define ev (/ (+ x 2) (+ x 1)))
                (define unev  (/ (+ x 1) (+ x 2)))
                ; (if (= (remainder x 2) 0)
                ; (println ev)
                ; (println unev))
                (if (= (remainder x 2) 0)
                    ev
                    unev
                   ))
        a inc b))))
; This approach did not work
; After all it did work, I just had to change 4 to 4.0. Why? Because simply scheme represents 
; result of division as fractions for some reason, just didn't see it.

; With restructured Wallis Formula from internet
; (define (approx-pi  b)
;     (* 2 (product (lambda (x) (/ (* 4 x x) (- (* 4 x x) 1))) 1 inc b)))