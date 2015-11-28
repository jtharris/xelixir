defmodule Teenager do
  def hey(input) do
    cond do
      String.ends_with? input, "?" -> "Sure."
      String.length(String.strip(input)) == 0 -> "Fine. Be that way!"
      # This is kind of weird, but it makes sure that there are alpha chars
      String.upcase(input) == input && String.downcase(input) != input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
