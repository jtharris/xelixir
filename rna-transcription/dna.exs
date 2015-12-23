defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    rna_map = %{
      ?G => ?C,
      ?C => ?G,
      ?T => ?A,
      ?A => ?U
    }

    # TODO:  Is there a more succinct way to do this?
    Enum.map(dna, &(Map.get(rna_map, &1)))
  end
end
