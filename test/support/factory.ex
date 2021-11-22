defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Ze banguela",
      email: "teste@teste.com",
      cpf: "123456789",
      age: 30,
      address: "Rua das mangas"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de maracuja",
      quantity: 1,
      unity_price: Decimal.new("47.60")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das mangas",
      items: [
        build(:item),
        build(:item,
          description: "tempero de soja",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("10.20")
        )
      ],
      total_price: Decimal.new("68.00"),
      user_cpf: "123456789"
    }
  end
end
