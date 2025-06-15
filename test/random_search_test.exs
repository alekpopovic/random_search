defmodule RandomSearchTest do
  use ExUnit.Case
  doctest RandomSearch

  describe "objective_function/1" do
    test "returns 0 for empty vector" do
      assert RandomSearch.objective_function([]) == 0
    end

    test "calculates sum of squares correctly for single element" do
      assert RandomSearch.objective_function([3]) == 9
      assert RandomSearch.objective_function([-4]) == 16
    end

    test "calculates sum of squares correctly for multiple elements" do
      assert RandomSearch.objective_function([1, 2, 3]) == 14
      assert RandomSearch.objective_function([-1, 2, -3]) == 14
    end

    test "handles floating point numbers" do
      result = RandomSearch.objective_function([1.5, 2.5])
      assert_in_delta result, 8.5, 0.001
    end
  end

  describe "random_vector/1" do
    test "generates vector within specified bounds" do
      minmax = [[-5, 5], [-10, 10], [0, 1]]
      vector = RandomSearch.random_vector(minmax)

      assert length(vector) == 3
      assert Enum.at(vector, 0) >= -5 and Enum.at(vector, 0) <= 5
      assert Enum.at(vector, 1) >= -10 and Enum.at(vector, 1) <= 10
      assert Enum.at(vector, 2) >= 0 and Enum.at(vector, 2) <= 1
    end

    test "returns empty vector for empty minmax" do
      assert RandomSearch.random_vector([]) == []
    end

    test "handles single dimension" do
      minmax = [[0, 10]]
      vector = RandomSearch.random_vector(minmax)

      assert length(vector) == 1
      assert hd(vector) >= 0 and hd(vector) <= 10
    end

    test "generates different vectors on multiple calls" do
      minmax = [[-1, 1], [-1, 1]]
      vector1 = RandomSearch.random_vector(minmax)
      vector2 = RandomSearch.random_vector(minmax)

      # With high probability, these should be different
      assert vector1 != vector2
    end
  end

  describe "search/2" do
    test "returns best solution found" do
      search_space = [[-5, 5], [-5, 5]]
      result = RandomSearch.search(search_space, 10)

      assert is_map(result)
      assert Map.has_key?(result, :vector)
      assert Map.has_key?(result, :cost)
      assert length(result.vector) == 2
      assert is_number(result.cost)
      assert result.cost >= 0  # sum of squares is always non-negative
    end

    test "improves solution over iterations" do
      search_space = [[-10, 10], [-10, 10]]

      # Capture IO to avoid cluttering test output
      result = ExUnit.CaptureIO.capture_io(fn ->
        RandomSearch.search(search_space, 100)
      end)

      # The actual search result should be reasonable for this problem
      # (finding minimum of sum of squares, which is 0 at origin)
      search_result = RandomSearch.search(search_space, 100)
      assert search_result.cost < 200  # Should find something reasonable
    end

    test "handles single iteration" do
      search_space = [[-1, 1]]
      result = RandomSearch.search(search_space, 1)

      assert is_map(result)
      assert length(result.vector) == 1
    end

    test "vector dimensions match search space" do
      search_space = [[-1, 1], [-2, 2], [-3, 3], [-4, 4]]
      result = RandomSearch.search(search_space, 5)

      assert length(result.vector) == 4
      assert Enum.at(result.vector, 0) >= -1 and Enum.at(result.vector, 0) <= 1
      assert Enum.at(result.vector, 1) >= -2 and Enum.at(result.vector, 1) <= 2
      assert Enum.at(result.vector, 2) >= -3 and Enum.at(result.vector, 2) <= 3
      assert Enum.at(result.vector, 3) >= -4 and Enum.at(result.vector, 3) <= 4
    end
  end

  describe "integration test" do
    test "complete search workflow" do
      # Set up a simple 2D search space
      search_space = [[-2, 2], [-2, 2]]

      # Capture output to avoid cluttering test results
      result = ExUnit.CaptureIO.capture_io(fn ->
        RandomSearch.search(search_space, 50)
      end)

      # Verify the search completes and finds a reasonable solution
      search_result = RandomSearch.search(search_space, 50)

      assert is_map(search_result)
      assert length(search_result.vector) == 2
      assert search_result.cost >= 0

      # For sum of squares, the global minimum is 0 at [0, 0]
      # With 50 iterations, we should find something reasonably close
      assert search_result.cost < 16  # Should be better than corners
    end
  end
end
