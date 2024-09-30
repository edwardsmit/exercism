defmodule BirdCount do
  def today([today | _previous_days]) do
    today
  end

  def today([]) do
    nil
  end

  def increment_day_count([today | previous_days]) do
    [today + 1 | previous_days]
  end

  def increment_day_count([]) do
    [1]
  end

  def has_day_without_birds?([today | previous_days]) do
    today == 0 || has_day_without_birds?(previous_days)
  end

  def has_day_without_birds?([]) do
    false
  end

  def total([today | previous_days]) do
    today + total(previous_days)
  end

  def total([]), do: 0

  def busy_days([today | previous_days]) do
    busy_days(previous_days) +
      if today >= 5 do
        1
      else
        0
      end
  end

  def busy_days([]), do: 0
end
