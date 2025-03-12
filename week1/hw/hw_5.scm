#lang simply-scheme
(define (ends-e sen)
  (if (empty? sen)
      '()
      (if (ends-e-word? (first sen))
          (se (first sen) (ends-e (bf sen)))
          (se '() (ends-e (bf sen)))
          )
      ))

(define (ends-e-word? wd)
  (equal? (last wd) 'e))

(ends-e '(please put the salami above the blue elephant))