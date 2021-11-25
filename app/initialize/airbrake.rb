# frozen_string_literal: true

require 'airbrake-ruby'

Airbrake.configure do |c|
  c.project_id = ENV['airbrake_project_id']
  c.project_key = ENV['airbrake_project_key']
end
