defmodule Boggle do
  defstruct value: nil, children: %{}

  @moduledoc """
  Implements a boggle solver using a trie for efficient word searching.
  """

def boggle(board, words) do
  numRow = tuple_size(board)
  numCol = tuple_size(elem(board, 0))

  Enum.reduce(words, %{}, fn word, acc ->
    char = list(word)
    findPaths = found(board, numRow ,numCol,char)

    if findPaths == [], do: acc, else: Map.put(acc, word, List.first(findPaths))
    end)
  end

  defp depthFirstSearchAlgorithm(_board, [], {x, y}, path, _numRow, _numCol) do
    [{x, y} | path]
  end

  defp depthFirstSearchAlgorithm(board, [first | rest_char], {x, y}, makePath, numRow, numCol) do
    case {character(board, {x, y}), first} do
      {char, char} ->
        makePath = [{x, y} | makePath]
        case rest_char do
          [] -> makePath
          _ -> checkBeside(board, rest_char, {x, y}, makePath, numRow, numCol)
        end
      _ ->
        []
    end
  end

  defp found(board, numRow,numCol, char) do
    for x <- 0..numRow,
          y <- 0..numCol,
          reduce: [] do
        acc ->
          case depthFirstSearchAlgorithm(board, char, {x, y}, [], numRow, numCol) do
            [] -> acc
            path ->
              reversed_path = Enum.reverse(path)
              [reversed_path | acc]
          end
      end
  end

  defp checkBeside(board, char_rest, {x, y}, path, numRow, numCol) do
    Enum.reduce(charBeside(x, y, numRow, numCol), [], fn {nx, ny}, acc ->
      if not_visited({nx, ny}, path) do
        case depthFirstSearchAlgorithm(board, char_rest, {nx, ny}, path, numRow, numCol) do
          [] -> acc
          result -> result
        end
      else
        acc
      end
    end)
  end

  defp not_visited({x, y}, path) do
    {x, y} not in path
  end

  defp charBeside(x, y, numRow, numCols) do
    for x_dir <- -1..1, y_dir <- -1..1, x_dir != 0 or y_dir != 0,
        nx = x + x_dir, ny = y + y_dir,
        nx in 0..(numRow), ny in 0..(numCols),
        do: {nx, ny}
  end

  defp list(word) when is_binary(word) do
    word |> String.codepoints()
  end

  defp character(board, {x, y}) when x in 0..(tuple_size(board) - 1) and y in 0..(tuple_size(elem(board, x)) - 1) do
    elem(elem(board, x), y)
  end

  defp character(_board, _pos), do: nil

end
