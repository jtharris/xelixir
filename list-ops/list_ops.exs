defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0

  @spec count(list) :: non_neg_integer
  def count([head | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], reversed), do: reversed
  defp _reverse([head | tail], reversed), do: _reverse(tail, [head | reversed])

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []

  @spec map(list, (any -> any)) :: list
  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head | tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc

  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([head | tail], acc, f) do
    f.(head, reduce(tail, acc, f))
  end

  @spec append(list, list) :: list
  def append([], b), do: b

  @spec append(list, list) :: list
  def append(a, []), do: a

  @spec append(list, list) :: list
  def append([a], b), do: [a | b]

  @spec append(list, list) :: list
  def append([head | tail], b) do
    [head | append(tail, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reduce(ll, [], &append/2)
  end
end
