(define (dupls-removed sen)
  (if (empty? sen)
    '()
    (if (member? (first sen) (dupls-removed (bf sen)))
      (se '() (dupls-removed (bf sen)))
      (se (first sen) (dupls-removed (bf sen))))))

