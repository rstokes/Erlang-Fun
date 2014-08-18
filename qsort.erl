-module(qsort).

-export([qsort/1]).

qsort(L) ->


quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(pivt, Rest, [], []),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).
