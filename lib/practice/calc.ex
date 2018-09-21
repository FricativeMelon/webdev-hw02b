defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def select_op(expr, op, fun) do
    if expr == :error do
      :error
    else
      i = Enum.find_index(expr, &(&1==op))
      cond do
        i == nil ->
          expr
        i == 0 || i == length(expr) ->
          :error
        true ->
          {s1, expr} = List.pop_at(expr, i-1)
          {s2, expr}  = List.pop_at(expr, i)
          s1 = parse_float(s1)
          s2 = parse_float(s2)
          select_op(List.replace_at(expr, i-1, fun.(s1, s2)), op, fun)
      end
    end
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    String.split(expr)
    |> select_op("*", &(&1 * &2))
    |> select_op("/", &(&1 / &2))
    |> select_op("+", &(&1 + &2))
    |> select_op("-", &(&1 - &2))

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end
end
