-module(main).
-export([hello/0, day1/0]).

hello() ->
    io:format("Hello~n").

day1() ->
    {ok, Device} = file:open("input", [read]),
    read_stdin(0, 0, 0, 0, Device).

read_stdin(Curr, Max, Smax, Tmax, Device) ->
    
    case io:get_line(Device, "") of
        eof ->
            init:stop(),
            file:close(Device),
            io:format("First Part: ~p~n", [max(Max, Curr)]),
            io:format("Second Part: ~p~n", [max(Max+Smax+Tmax, Curr+Max+Smax)]);
        "\n" -> 
            if 
                Curr > Max -> 
                    read_stdin(0, Curr, Max, Smax, Device);
                true ->
                    read_stdin(0, Max, Smax, Tmax, Device)
            end;
        Line ->
            S=re:replace(Line, "\\s+", "", [global, {return, list}]),
            I=list_to_integer(S),
            read_stdin(Curr+I, Max, Smax, Tmax, Device)
    end.
