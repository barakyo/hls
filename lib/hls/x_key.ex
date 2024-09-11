defmodule HLS.XKey do
  require Logger
  # # These attributes are enum and all caps without quotes
  # @enum_values ~w(type default autoselect forced)a

  # # These are attributes that MUST have their values double quoted.
  # @string_values ~w(uri group_id language assoc_language name instream_id characteristics channels)a

  # # This defines the order, as specified in the RFC. Its not strictly
  # # required, but makes things more consistent and easier to test.
  # @attribute_order ~w(type uri group_id language assoc_language name default autoselect forced instream_id characteristics channels)a

  defstruct [:iv, :method, :uri]

  def build(nil), do: nil

  def build(line) do
    %{"IV" => iv, "METHOD" => method, "URI" => uri} = line.attributes

    %__MODULE__{iv: iv, method: method, uri: uri}
  end
end
