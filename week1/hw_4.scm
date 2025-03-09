#lang simply-scheme
(define (ordered? sen)
  (cond ((empty? sen) #t)
        ((empty? (bf sen)) #t)
        (else  (if (< (first sen) (first (bf sen)))
          (ordered? (bf sen))
          #f)
        )))
  

(ordered? '(1 2 4 3))