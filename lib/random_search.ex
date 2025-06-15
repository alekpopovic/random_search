defmodule RandomSearch do
  def objective_function(vector) do
    Enum.reduce(vector, 0, fn x, sum -> sum + (x * x) end)
  end

  def random_vector(minmax) do
    Enum.map(minmax, fn [min, max] ->
      min + ((max - min) * :rand.uniform())
    end)
  end

  def search(search_space, max_iter) do
    Enum.reduce(0..(max_iter-1), nil, fn iter, best ->
      vector = random_vector(search_space)
      candidate = %{
        vector: vector,
        cost: objective_function(vector)
      }

      new_best = if best == nil or candidate.cost < best.cost do
        candidate
      else
        best
      end

      IO.puts(" > iteration=#{iter + 1}, best=#{new_best.cost}")
      new_best
    end)
  end
end
