defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """

  @spec letters(String.t) :: [String.t]
  def letters(word) do
    word
    |> String.graphemes
    |> Enum.map(&String.downcase/1)
    |> Enum.sort
  end

  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_lowered = String.downcase(base)
    base_letters = letters(base)

    Enum.filter(candidates, fn candidate ->
      base_lowered != String.downcase(candidate) &&
      base_letters == letters(candidate)
    end)
  end
end
