(define (ins-sort sent)
  (if (empty? sent) '()
  (insert (first sent) (ins-sort (bf sent)))))

(define (insert num sent)
  (println "insert called")
  (cond
    ((empty? sent) (se num))
    ((< num (first sent)) (se num sent))
    (else
      (se (first sent)
        (insert num (bf sent))))))
(ins-sort '( 1 5 4 2))
