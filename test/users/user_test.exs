defmodule Exlivery.Users.UserText do
  use ExUnit.Case
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua das mangas",
          "Ze banguela",
          "teste@teste.com",
          "123456789",
          30
        )

      expected_response = {:ok, build(:user)}

      assert expected_response == response
    end

    test "when there are invalid params, retuns a error" do
      response =
        User.build(
          "avenida brazil",
          "Manuela",
          "teste2@teste2.com",
          "987654321",
          10
        )

      expected_response = {:error, "Invalid age"}

      assert expected_response == response
    end
  end
end
