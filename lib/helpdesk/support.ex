defmodule Helpdesk.Support do
  use Ash.Domain, extensions: [AshJsonApi.Domain]

  resources do
    resource Helpdesk.Support.Ticket
  end

    json_api do
    routes do
      base_route "/tickets", Helpdesk.Support.Ticket do
        post :create
        patch :update
      end
    end
  end
end
