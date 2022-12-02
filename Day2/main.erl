-module(main).
-export([solve/0]).
-import(string, [substr/3]).

solve() ->
    {ok, Device} = file:open("input", [read]),
    read_stdin(Device, 0).

read_stdin(Device, Score) ->
    
    case io:get_line(Device, "") of
        eof ->
            init:stop(),
            io:format("Your Score: ~p~n", [Score]),
            file:close(Device);
        "A X\n" ->
            read_stdin(Device, Score + 3 + 0);
        "A Y\n" ->
            read_stdin(Device, Score + 1 + 3);
        "A Z\n" ->
            read_stdin(Device, Score + 2 + 6);
        "B X\n" ->
            read_stdin(Device, Score + 1 + 0);
        "B Y\n" ->
            read_stdin(Device, Score + 2 + 3);
        "B Z\n" ->
            read_stdin(Device, Score + 3 + 6);
        "C X\n" ->
            read_stdin(Device, Score + 2 + 0);
        "C Y\n" ->
            read_stdin(Device, Score + 3 + 3);
        "C Z\n" ->
            read_stdin(Device, Score + 1 + 6)
    end.
