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
    Practice.Factor.factor(2, x,[]) #initial entry point input (1,2,x)
  end

  def isPal(x) do
    words = String.split(x) #if the palindrome is a phrase
    words = Enum.join(words, "") #add the words together to form a single string
    reversed = reverse_chars(words)
    cond do
      words == reversed ->
        "is a palindrome"
      words != reversed ->
        "isn't a palindrome"
    end
  end

  def reverse_chars(word) do
    word
    |> String.to_charlist
    |> Enum.reverse
    |> to_string
  end
end
