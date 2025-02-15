defmodule ScenicSample2 do
  @moduledoc """
  Starter application using the Scenic framework.
  """

  def start(_type, _args) do
    # load the viewport configuration from config
    main_viewport_config = Application.get_env(:scenic_sample_2, :viewport)

    # start the application with the viewport
    children = [
      ScenicSample2.Sensor.Supervisor,
      {Scenic, viewports: [main_viewport_config]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
