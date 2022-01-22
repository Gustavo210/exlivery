# Exlivery

## Description

interface of comand line to create a users and orders for write in a csv

## How to install

```bash
  mix deps.get
```

## How to test

```bash
  mix test
```

## How to use

primeiro entre no terminal intergrado com

```bash
  MIX_TEST=test iex -S mix
```

In integrated terminal you can write

```bash
  alias Exlivery.Orders.Report
  alias Exlivery.Users.User
  alias Exlivery.Orders.Order
  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.User.Agent, as: UserAgent

  import Exlivery.Factory

```

create a user

```bash
  build(:user) |> UserAgent.save()
```

create a Order

```bash
  build(:order) |> OrderAgent.save()
```
