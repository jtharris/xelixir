defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    words = String.replace(sentence, "_", " ") |> String.split

    Enum.reduce(words, %{}, fn(word, wc) ->
      try do
        word = Regex.run(~r/[\w-]+/u, word) |> hd |> String.downcase
        Dict.put(wc, word, Dict.get(wc, word, 0) + 1)
      rescue
        # This happens when the regex doesn't match and is passed to hd
        ArgumentError -> wc
      end
    end)
  end
end
