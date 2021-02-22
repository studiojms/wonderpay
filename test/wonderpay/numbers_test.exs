defmodule Wonderpay.NumbersTest do
  use ExUnit.Case

  alias Wonderpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name, return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert expected_response == response
    end

    test "when there is not a file with the given name, return an error message" do
      response = Numbers.sum_from_file("invalid-name")

      expected_response = {:error, %{message: "Invalid file!"}}

      assert expected_response == response
    end

  end

end
