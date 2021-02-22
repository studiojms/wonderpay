defmodule WonderpayWeb.WelcomeController do
  use WonderpayWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to WonderPay API")
  end

end
