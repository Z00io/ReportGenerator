defmodule ReportGenerator.ParserTest do
  use ExUnit.Case

  alias ReportGenerator.Parser

  describe "file/1" do
    test "parses the file" do
      file_name = "gen_report.csv"

      response =
        file_name
        |> Parser.file()
        |> Enum.member?(["daniele", 7, 29, "abril", 2018])

      assert response == true
    end
  end
end
