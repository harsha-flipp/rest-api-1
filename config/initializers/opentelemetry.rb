require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'rest-api-1' #ENV['SERVUCE_NAME']
  c.use_all() # enables all instrumentation!
end
