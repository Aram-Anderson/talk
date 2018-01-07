defmodule Talk.Web do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use Talk.Web, :controller
      use Talk.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias Talk.Repo
      import Ecto
      import Ecto.Query

      import Talk.Router.Helpers
      import Talk.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"
      use Phoenix.HTML.SimplifiedHelpers

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Talk.Router.Helpers
      import Talk.ErrorHelpers
      import Talk.Gettext

      # import ReactPhoenix.ClientSide
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias Talk.Repo
      import Ecto
      import Ecto.Query
      import Talk.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
