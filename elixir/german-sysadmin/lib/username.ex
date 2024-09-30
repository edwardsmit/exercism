defmodule Username do
  def sanitize([] = username) do
    username
  end

  def sanitize([head | _tail] = username) when head == ?_ do
    accept_head(username)
  end

  def sanitize([head | _tail] = username) when head >= ?a and head <= ?z do
    accept_head(username)
  end

  def sanitize([head | tail] = username) do
    case head do
      ?ä -> sanitize(~c"ae" ++ tail)
      ?ö -> sanitize(~c"oe" ++ tail)
      ?ü -> sanitize(~c"ue" ++ tail)
      ?ß -> sanitize(~c"ss" ++ tail)
      _ -> drop_head(username)
    end
  end

  defp accept_head([head | tail]) do
    [head] ++ sanitize(tail)
  end

  defp drop_head([_head | tail]) do
    sanitize(tail)
  end
end
