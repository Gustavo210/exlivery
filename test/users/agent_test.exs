defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})
      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678901"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua das mangas",
           age: 30,
           cpf: "12345678901",
           email: "teste@teste.com",
           name: "Ze banguela"
         }}

      assert expected_response == response
    end

    test "when the user is not found, returns an error" do
      :user
      |> build()
      |> UserAgent.save()

      response = UserAgent.get("ola mundo")

      expected_response = {:error, "User not found"}

      assert expected_response == response
    end
  end
end
