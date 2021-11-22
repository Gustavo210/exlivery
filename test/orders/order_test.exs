defmodule Exlivery.Orders.OrderText do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns the order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "tempero de soja",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("10.20")
        )
      ]

      response =
        Order.build(
          user,
          items
        )

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is no items, returns the error" do
      user = build(:user)

      items = []

      response =
        Order.build(
          user,
          items
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
