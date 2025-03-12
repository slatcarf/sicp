; How `let*` works under the hood
(let* ((a 3) (b (+ a 4)))
    (* a b))
; Expands to -->
(let ((a 3))
    (let ((b (+ a 4)))
        (* a b)))
; Expands to -->
((lambda (a) 
    ((lambda (b)
        (* a b)) (+ a 4))) 3)


; What would happen if you use let to define a inner variable that references another inner variable, but using normal order evaluation?
(let ((a 3) (b (+ a 4)))
    (* a b))
; Expands to -->
((lambda (a b) 
    (* a b)) 3 (+ a 4))
; Expands to --> Question: Would a be now defined here as 3? Or not? Would this work?
(* 3 (+ a 4))


; Why we can't use recursion in normal let
(let ((fact (lambda (x)
        (if (= x 1)
            (1)
            (* x (fact (- x 1)))))))
    (fact 5))
; Expands to -->
((lambda (fact) 
    (fact 5)) (lambda (x)
        (if (= x 1)
            (1)
            (* x (fact (- x 1)))))) ; Here, `fact` is not defined yet. It is only defined inside the body of the first lambda function.

; Like this is works of course.
 (define fact (lambda (x)
    (if (= x 1)
        1
        (* x (fact (- x 1))))))