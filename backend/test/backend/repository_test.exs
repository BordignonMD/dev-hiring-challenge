defmodule Backend.RepositoryTest do
  use Backend.DataCase

  alias Ecto.Changeset
  alias Backend.Repository

  describe "changeset/1" do
    test "when the params are valid, returns a valid changeset" do
      params = %{id: 123,
                 name: "name_example",
                 description: "description_example",
                 language: "language_example",
                 url: "url_example",
                 stars: 123,
                 last_update: "2021-07-26T22:12:12Z"}

      response = Repository.changeset(params)

      assert %Changeset{changes:
        %{description: "description_example",
          id: 123,
          language: "language_example",
          last_update: "2021-07-26T22:12:12Z",
          name: "name_example",
          stars: 123,
          url: "url_example"}, valid?: true} = response
    end

    test "when the params are invalid, returns an invalid changeset" do
      params = %{}

      expected_response = %{description: ["can't be blank"],
                            id: ["can't be blank"],
                            language: ["can't be blank"],
                            last_update: ["can't be blank"],
                            name: ["can't be blank"],
                            stars: ["can't be blank"],
                            url: ["can't be blank"]}

      response = Repository.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
