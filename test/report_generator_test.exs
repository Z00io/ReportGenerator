defmodule ReportGeneratorTest do
  use ExUnit.Case

  alias ReportGenerator
  alias ReportGenerator.Support.ReportFixture

  @file_name "gen_report.csv"

  describe "build/1" do
    test "When passing file name return a report" do
      response = ReportGenerator.build(@file_name)

      assert response == ReportFixture.build()
    end

    test "When no filename was given, returns an error" do
      response = ReportGenerator.build()

      assert response == {:error, "Insira o nome de um arquivo"}
    end
  end
end
