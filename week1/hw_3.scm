#lang simply-scheme
(define (switch sen)
  (if (empty? sen)
      '()
      (sentence (opposite (first sen))
                (switch (bf sen)))))


(define (opposite w)
   (cond ((eq? w 'I) 'you)
       ((eq? w 'i) 'you)
       ((eq? w 'me) 'you)
       ((eq? w 'You) 'I)
       ((eq? w 'you) 'me)
       (else w)) )

(switch '(You told me that I should wake you up))