defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec deal(any, integer) :: {[any], [any]}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filname) do
    binary = :erlang.term_to_binary(deck)
    File.write(filname, binary)
  end

  @spec load(
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ) :: any
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, _reason} ->
        "File Doesnot Exist"
    end
  end

  def create_hand(handsize) do
    Cards.create_deck() |> Cards.shuffle() |> Cards.deal(handsize)
  end
end
