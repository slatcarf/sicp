(define (cc amount)
  (count-change amount 5))

(define
  (count-change amount num-of-denoms)
  (cond ((= amount 0) 1)
    ((or (< amount 0) (= num-of-denoms 0)) 0)
    (else
      (+
        (count-change amount (- num-of-denoms 1))
        (count-change
          (- amount
            (first-denom num-of-denoms)) num-of-denoms)))))

(define
  (first-denom num-of-denoms)
  (cond
    ((= num-of-denoms 1) 1)
    ((= num-of-denoms 2) 5)
    ((= num-of-denoms 3) 10)
    ((= num-of-denoms 4) 25)
    ((= num-of-denoms 5) 50)))
(println (cc 10))

(define a '())
