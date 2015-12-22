defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, a), do: :equal

  def compare(a, b) do
    case Enum.count(a) - Enum.count(b) do
      0 -> :unequal
      x when x < 0 -> compare(b, a, :sublist)
      _ -> compare(a, b, :superlist)
    end
  end

  def compare(a, b, list_type) do
    a_window = Enum.slice(a, 0, Enum.count(b))

    cond do
      a_window === b -> list_type
      a_window === a -> :unequal
      true -> compare(tl(a), b, list_type)
    end
  end

end
