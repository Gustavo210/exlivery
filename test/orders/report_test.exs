defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "creates the report file" do
      :order |> build() |> OrderAgent.save()

      :order |> build() |> OrderAgent.save()

      expected_response =
        "123456789,pizza,1,47.60japonesa,2,10.20,68.00\n" <>
          "123456789,pizza,1,47.60japonesa,2,10.20,68.00\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
