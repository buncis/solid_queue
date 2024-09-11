# frozen_string_literal: true

require "thor"

module SolidQueue
  class Cli < Thor
    class_option :config_file, type: :string, aliases: "-c",
      default: Configuration::DEFAULT_CONFIG_FILE_PATH,
      desc: "Path to config file",
      banner: "SOLID_QUEUE_CONFIG"

    class_option :recurring_schedule_file, type: :string,
      default: Configuration::DEFAULT_RECURRING_SCHEDULE_FILE_PATH,
      desc: "Path to recurring schedule definition",
      banner: "SOLID_QUEUE_RECURRING_SCHEDULE"

    class_option :skip_recurring, type: :boolean, default: false

    def self.exit_on_failure?
      true
    end

    desc :start, "Starts Solid Queue supervisor to dispatch and perform enqueued jobs. Default command."
    default_command :start

    def start
      SolidQueue::Supervisor.start(**options.symbolize_keys)
    end
  end
end