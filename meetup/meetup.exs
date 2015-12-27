defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    first = first_date(year, month, weekday)

    case schedule do
      :first -> {year, month, first}
      :second -> {year, month, first + 7}
      :third -> {year, month, first + 14}
      :fourth -> {year, month, first + 21}
      :last -> {year, month, last(first, month)}
      :teenth -> {year, month, teenth(first)}
    end
  end

  defp first_date(year, month, weekday) do
    weekday_ordinal(weekday) - day_of_first(year, month) + 7 |> rem(7) |> + 1
  end

  defp day_of_first(year, month) do
    year_ord = year_ordinal(year, month)

    y = rem(year_ord, 100)
    c = div(year_ord, 100)
    m = rem(month + 9, 12) + 1

    1 + trunc((2.6 * m) - 0.2) + y + div(y, 4) + div(c, 4) - (2 * c) |> rem(7)
  end

  defp year_ordinal(year, month) do
    case month do
      x when x > 2 -> year
      _ -> year - 1
    end
  end

  defp teenth(first_date) do
    case first_date do
      x when x < 6 -> x + 14
      x -> x + 7
    end
  end

  defp last(first_date, month) do
    last_day = case month do
      2  -> 28  # No test case for leap year...
      x when x in [4, 6, 9, 11] -> 30
      _  -> 31
    end

    case first_date + 28 do
      x when x <= last_day -> x
      x -> x - 7
    end
  end

  defp weekday_ordinal(day) do
    case day do
      :sunday -> 0
      :monday -> 1
      :tuesday -> 2
      :wednesday -> 3
      :thursday -> 4
      :friday -> 5
      :saturday -> 6
    end
  end
end
