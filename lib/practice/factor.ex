defmodule Practice.Factor do

  def factor(x, n, acc) do
    cond do
      n*n > x ->
        Enum.reverse([x] ++ acc)
      rem(x, n) == 0 ->
        factor(div(x, n), n, [n] ++ acc)
      true ->
        factor(x, n+1, acc)
    end
  end
end
