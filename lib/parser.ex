defmodule ReportGenerator.Parser do
  @months %{
    "1" => "janeiro",
    "2" => "fevereiro",
    "3" => "março",
    "4" => "abril",
    "5" => "maio",
    "6" => "junio",
    "7" => "julho",
    "8" => "agosto",
    "9" => "setembro",
    "10" => "outubro",
    "11" => "novembro",
    "12" => "dezembro"
  }
  def file(filename) do
    "report/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(0, &String.to_atom(&1))
    |> List.update_at(1, &String.to_integer(&1))
    |> List.update_at(3, &String.to_atom(Map.get(@months, &1)))
    |> List.update_at(4, &String.to_integer(&1))
  end
end
