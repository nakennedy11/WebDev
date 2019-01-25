defmodule Practice.Factor do
  def factor(acc, x, ans) do
    cond do  
      x == acc ->
        ans++[acc]
      rem(x, acc) == 0 -> 
        factor(acc, div(x, acc), ans++[acc])
      rem(x, acc) != 0  ->
        factor(acc + 1, x, ans)
    end
  end      
end



