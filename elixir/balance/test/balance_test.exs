defmodule BalanceTest do
  use ExUnit.Case

  describe "easy mode" do

    doctest Balance

    test "Even List" do
      assert Balance.find([1, 2, 3, 4, 4, 3, 2, 1]) == 4
    end

    test "Odd List" do
      assert Balance.find([1, 1, 2]) == 2
    end

    test "Odd List with Center Balanced" do
      assert Balance.find([1, 2, 1]) == {:error, :unbalanced}
    end

    test "No Natural Pivot Point" do
      assert Balance.find([1, 1, 1000, 1]) == {:error, :unbalanced}
    end

  end

  describe "hard mode" do

    doctest BalanceExact

    test "Even List" do
      assert BalanceExact.find([1, 2, 3, 4, 4, 3, 2, 1]) == 4
    end

    test "Odd List" do
      assert BalanceExact.find([1, 1, 2]) == 2
    end

    test "Odd List with Center Balanced" do
      assert BalanceExact.find([1, 2, 1]) == 1.5
    end

    test "No Natural Pivot Point" do
      assert BalanceExact.find([1, 1, 1000, 1]) == 2.499
    end

  end



end
