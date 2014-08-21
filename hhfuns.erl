-module(hhfuns).

-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|T].

decrement([]) -> [];
decrement([H|T]) -> [H-1|T].

map(_, []) -> throw(fart);
map(F, [H|T]) -> [F(H)|map(F, T)].

incr_one(X) -> X + 1.
