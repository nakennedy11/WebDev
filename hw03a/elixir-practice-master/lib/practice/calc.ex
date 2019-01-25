defmodule Practice.Calc do
  
  # parse the given list into nums and ops
  def parse_expr(text) do
    Enum.map(text, fn(x) -> 
          if (x == "/" or x == "*" or x == "+" or x == "-") do
            {:op, x}
          else
            {num, _} = Float.parse(x)
            {:num, num}
        end
       end)      
  end 


  # if there is a case with a * or /
  def eval_md([{:num, num1}, {:op, op}, {:num, num2} | rest] ) do
    cond do 
      op == "*" ->
        eval_md([{:num, num1 * num2}] ++ rest)
      op == "/" ->
        eval_md([{:num, num1 / num2}] ++ rest)
      true ->
        [{:num, num1}, {:op, op}] ++  eval_md([{:num, num2}] ++ rest)
    end
   end

  # if there is not
  def eval_md([first | rest]) do
    [first] ++ eval_md(rest)
  end
  
  # if the list is empty
  def eval_md([]) do
    []
  end
 
 # if there is a case with a + or -
  def eval_ps([{:num, num1}, {:op, op}, {:num, num2} | rest] ) do
    cond do 
      op == "+" ->
        eval_ps([{:num, num1 + num2}] ++ rest)
      op == "-" ->
        eval_ps([{:num, num1 - num2}] ++ rest)
      true ->
        [{:num, num1}, {:op, op}] ++  eval_ps([{:num, num2}] ++ rest)
    end
   end

  # if there is not
  def eval_ps([first | rest]) do
    [first] ++ eval_ps(rest)
  end
  
  # if the list is empty
  def eval_ps([]) do
    []
  end

  def eval(expr)  do 
    eval_ps(eval_md(expr))
  end
  
  def getAns([{:num, num1}]) do
    trunc(num1)
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |> String.split(~r/\s+/) #splits expr by spaces
    |> parse_expr
    |> eval
    |> getAns

  end
end
