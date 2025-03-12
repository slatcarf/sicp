(define (filtered-accumulate pred combiner null-value term a next b)
    (if (> a b)
        null-value
        (if (pred a)
            (combiner (term a)
                 (filtered-accumulate pred combiner null-value term (next a) next b))
             (filtered-accumulate pred combiner null-value term (next a) next b))
            ))


(define (inc n)
    (+ n 1))

(define (identity n)
    n)

(define (square n)
    (* n n))

; prime predicate is assumed to be given
(define (prime? n)
   #t)

; gcd already exists in scheme and I wanted to write it myself (we skipped it in chapter 2)
(define (mygcd a b)
   (if (= (remainder a b) 0)
        b
        (gcd b (remainder a b)))
)
(define (sum-squares-prime a b)
    (filtered-accumulate prime? + 0 square a inc b))

(define (prod-rel-prime-lt-n n)
    (define (relprimen? a)
        (= (mygcd a n) 1))
    (filtered-accumulate relprimen? * 1 identity 1 inc (- n 1)))

