defmodule Streamex.Follow do
  defstruct feed_id: nil,
            target_id: nil,
            created_at: nil,
            updated_at: nil

  @doc """
  Converts a map coming from the API into
  an Activity struct.
  """
  def to_struct(%{} = attrs) do
    attrs
    |> Map.to_list
    |> Enum.reduce(struct(%__MODULE__{}), fn({k, v}, acc) ->
      %{acc | String.to_atom(k) => v}
    end)
  end

  @doc """
  Converts an Activity struct into a json payload.
  """
  def to_json(%__MODULE__{} = follow) do
    {:ok, body} = Poison.encode(follow)
    body
  end
end