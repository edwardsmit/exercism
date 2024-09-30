defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  @conversion_table %{
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
    milliliter: 1
  }

  def to_milliliter({unit, volume}) do
    multiplier = Map.get(@conversion_table, unit)
    {:milliliter, multiplier * volume}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    diviser = Map.get(@conversion_table, unit)
    {unit, volume / diviser}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
