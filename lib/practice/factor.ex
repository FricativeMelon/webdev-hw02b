defmodule Practice.Factor do

  def factor(x, n, acc) do
    cond do
      n*n > x ->
        if length(acc) == 0 do
          [x]
        else
          Enum.reverse(acc)
        end
      rem(x, n) == 0 ->
        factor(div(x, n), n, [n] ++ acc)
      true ->
        factor(x, n+1, acc)
    end
  end
end
