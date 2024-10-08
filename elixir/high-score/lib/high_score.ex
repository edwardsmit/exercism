defmodule HighScore do
  def new() do
    %{}
  end

  @default_initial_score 0

  def add_player(scores, name, score \\ @default_initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, @default_initial_score + score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
