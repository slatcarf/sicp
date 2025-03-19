(define (count sent)
  (if (empty? sent) 0
    (+ 1 (count (bf sent)))))
(trace count)

(println
  (count '(I want to hold your hand)))

(define (count-iter sent)
  (define (iter sent count)
    (if (empty? sent) count
      (iter (bf sent) (+ count 1)))) (trace iter) (iter sent 0))

(println
  (count '(I want to hold your hand)))
