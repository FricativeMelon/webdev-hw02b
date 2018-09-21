defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x) do
    2 * x
  end

  def calc(expr) do
    # This is more complex, delegate to lib/practice/calc.ex
    Practice.Calc.calc(expr)
  end

  def factor(x) do
    Practice.Factor.factor(x, 2, [])
  end

  def palindrome(x) do
    v = String.length(x)
    if v < 2 do
        true
    else
      s1 = String.slice(x, 0, div(v, 2))
      s2 = String.slice(x, div(v+1, 2), div(v,2))
      s2 = String.reverse(s2)
      String.equivalent?(s1, s2)
    end
  end
end
