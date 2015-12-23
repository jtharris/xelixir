defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([], []) :: non_neg_integer
  def hamming_distance([], []), do: 0

  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance([s | strand1], [s | strand2]) do
    hamming_distance(strand1, strand2)
  end

  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    if Enum.count(strand1) == Enum.count(strand2) do
      1 + hamming_distance(tl(strand1), tl(strand2))
    else
      nil
    end
  end
end
