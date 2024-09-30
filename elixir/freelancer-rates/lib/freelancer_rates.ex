defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    @hours_per_day * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount / 100 * discount
  end

  def monthly_rate(hourly_rate, discount) do
    (@billable_days_per_month * discounted_daily_rate(hourly_rate, discount))
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / discounted_daily_rate(hourly_rate, discount))
    |> Float.floor(1)
  end

  defp discounted_daily_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
  end
end
