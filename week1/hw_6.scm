#lang simply-scheme


(define (loop) (loop))
; if ordinary procedure -> infinite loop
; if special form -> #f
(and #f (loop))


; Positives of treating `or` as special form: if one of the arguments evaluate to true,
; none of the others have to be evaluated. This is more efficient than first evaluating
; all argument expressions, which might be expensive. Also, this way you can use or to
; call a function only if the preceding argument was false, or use it to provide default
; values.

;