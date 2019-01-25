defmodule Practice.Factor do
  def factor(acc, x, ans) do
    cond do  
      x == acc -> # if x is a prime
        ans++[acc] # add the accumulator to the answer
      rem(x, acc) == 0 -> # if acc | x
        factor(acc, div(x, acc), ans++[acc]) # recur with another prime factor
      rem(x, acc) != 0  -> # increment the acc if nothing divides
        factor(acc + 1, x, ans)
    end
  end      
end



