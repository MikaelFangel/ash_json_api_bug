defmodule Helpdesk.Support.Ticket do
  use Ash.Resource,
    otp_app: :helpdesk,
    domain: Helpdesk.Support,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource]

  json_api do
    type "ticket"
  end

  postgres do
    table "tickets"
    repo Helpdesk.Repo
  end

  actions do
    defaults [:read]

    create :create do
      accept [:additional_data]
    end
    update :update do
      accept [:additional_data]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :additional_data, :map do
      public? true
      default %{}
    end

    timestamps()
  end
end
