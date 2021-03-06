defmodule Issues.GithubIssues do
  @user_agent [{"User-agent", "Elixir Steven@example.com"}]
  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response

  end
  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %{body: body}}) do
    {:ok, :jsx.decode(body)}
  end
  def handle_response({_, %{body: body}}) do
    {:error, :jsx.decode(body)}
  end
end
