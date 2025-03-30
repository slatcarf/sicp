(load "twenty-one.scm")

; Test case 1: Dealer has Ace showing and customer has 16
(define test-1 (dealer-sensitive '(9h 7s) 'Ad))  ; Customer has 16, dealer shows Ace
(println test-1)  ; Expected: #t (Customer hits because total is less than 17)

; Test case 2: Dealer has 2 showing and customer has 11
(define test-2 (dealer-sensitive '(8h 3s) '2s))  ; Customer has 11, dealer shows 2
(println test-2)  ; Expected: #t (Customer hits because total is less than 12)

; Test case 3: Dealer has 5 showing and customer has 15
(define test-3 (dealer-sensitive '(9h 6s) '5s))  ; Customer has 15, dealer shows 5
(println test-3)  ; Expected: #f (Customer stays because total is 15, which is >= 12)

; Test case 4: Dealer has 10 showing and customer has 17
(define test-4 (dealer-sensitive '(10s 7h) '10s))  ; Customer has 17, dealer shows 10
(println test-4)  ; Expected: #f (Customer stays because total is 17 or more)

(define test-8 (dealer-sensitive '(10s 6h) '10s))  ; Customer has 16, dealer shows 10
(println test-8)  ; Expected: #t (Customer hits because total is less than 17)


; Test case 5: Dealer has 6 showing and customer has 12
(define test-5 (dealer-sensitive '(10s 2h) '6s))  ; Customer has 12, dealer shows 6
(println test-5)  ; Expected: #f (Customer stays because total is >= 12)

; Test case 6: Dealer has 9 showing and customer has 14
(define test-6 (dealer-sensitive '(8s 6h) '9s))  ; Customer has 14, dealer shows 9
(println test-6)  ; Expected: #t (Customer hits because total is less than 17)

; Test case 7: Dealer has Jack showing and customer has 18
(define test-7 (dealer-sensitive '(10s 8s) 'js))  ; Customer has 18, dealer shows Jack
(println test-7)  ; Expected: #f (Customer stays because total is >= 17)
