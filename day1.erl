-module(day1).
-export([hello/0, day1/0]).

hello() ->
    io:format("Hello~n").

day1() ->
    {ok, Device} = file:open("input_day1", [read]),
    read_stdin(0, 0, Device).

read_stdin(Curr, Max, Device) ->
    
    case io:get_line(Device, "") of
        eof ->
            init:stop(),
            file:close(Device),
            io:format("~p", [Max]);
        "\n" -> 
            read_stdin(0, Max, Device);
        Line ->
            S=re:replace(Line, "\\s+", "", [global, {return, list}]),
            I=list_to_integer(S),
            read_stdin(Curr+I, max(Max, Curr + I), Device)
    end.
