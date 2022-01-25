class WelcomeController < ApplicationController
  def index
    puts Article.all.count
    a = Article.create!(title: 'MyTitle'+Time.now.to_s, text: 'MyText' )
    a.save!
    puts "=======NET HTTP Response ========="
    puts Net::HTTP.get(URI('http://localhost:3012/welcome2/index2'))
    puts "=======HTTPX Response ========="
    tracer = OpenTelemetry.tracer_provider.tracer('my-tracer')
    tracer.in_span("httpX_response") do |span|
      sleep(2)
      puts HTTPX.get('http://localhost:3012/welcome2/index3')
    end

    render json: {'blah':'test'}
  end
end
