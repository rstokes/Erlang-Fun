-module(recursive).

-export([fac/1, len/1, tail_fac/1, duplicate/2, reverse/1, sublist/2, zip/2]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0 -> N*fac(N-1).


len(L) -> tail_len(L,0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).


tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N*Acc).


%duplicate(0, _) -> [];
%duplicate(N, Term) when N > 0 ->
%  [Term|duplicate(N-1, Term)].

duplicate(N, Term) -> tail_dup(N, Term, []).

tail_dup(0, _, List) ->
  List;
tail_dup(N, Term, List) ->
  tail_dup(N-1, Term, [Term|List]).


% reverse([]) -> [];
% reverse([H|T]) -> reverse(T)++(H).

reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

sublist(L, N) -> lists:reverse(subl_tail(L, N, [])).

subl_tail(_, 0, SubList) -> SubList;
subl_tail([], _, SubList) -> SubList;
subl_tail([H|T], N, SubList) -> subl_tail(T, N-1, [H|SubList]).

zip(L1, L2) -> lists:reverse(tail_zip(L1, L2, [])).

tail_zip([], _, Acc) -> Acc;
tail_zip(_, [], Acc) -> Acc;
tail_zip([H1|T1], [H2|T2], Acc) -> tail_zip(T1, T2, [{H1, H2} | Acc]).
