defmodule Balance do

  def find(list) when is_list(list) do
    sum = Enum.sum(list)
    do_find(list, 0, 0, sum)
  end

  defp do_find([], _, _, _), do: {:error, :unbalanced}

  defp do_find(_, idx, lhs, sum) when sum - lhs == lhs,
    do: idx

  defp do_find([head|tail], idx, lhs, sum),
    do: do_find(tail, idx + 1, lhs + head, sum)

end

defmodule BalanceExact do

  def find(list) when is_list(list) do
    sum = list |> Enum.sum
    do_find(list, list, 0, 0, sum)
  end

  defp do_find([], _, _, _, _), do: {:error, :empty}

  defp do_find(_, _, idx, lhs, sum) when sum - lhs == lhs, do: idx

  defp do_find(list, tail, idx, lhs, sum) when sum - lhs < lhs do
    index = idx - 1 # take a step back 1
    sub_index = find_sub_index(list, index) # find inner balance
    index + sub_index
  end

  defp do_find(list, [head|tail], idx, lhs, sum),
    do: do_find(list, tail, idx + 1, lhs + head, sum)

  defp find_sub_index(list, index) do
    {lhs, [idx_elem | rhs]} = Enum.split(list, index)
    diff = Enum.sum(lhs) - Enum.sum(rhs)
    ((idx_elem / 2) - diff) / idx_elem
  end

end
