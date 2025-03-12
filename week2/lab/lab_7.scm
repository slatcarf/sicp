(define (make-tester w)
    (lambda (x)
        (eq? x w)))