# SICP Exercise 1.6
Since `new-if` is defined as an ordinary compound procedure,
when calling it, all argument expressions get evaluated before being substituted
for the formal parameters in the body of the procedure. That means that the recursive call
to `sqrt-iter` will always be evaluated, no matter if the predicate is true or false. So the
program will never end.