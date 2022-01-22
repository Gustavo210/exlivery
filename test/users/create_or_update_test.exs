defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Paulo e pinho",
        address: "rua A",
        email: "paulo_e_pinho@gmail.com",
        cpf: "12345678901",
        age: 20
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Paulo e pinho",
        address: "rua A",
        email: "paulo_e_pinho@gmail.com",
        cpf: "12345678901",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid age"}

      assert response == expected_response
    end
  end
end
