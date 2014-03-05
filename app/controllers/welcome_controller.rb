class WelcomeController < ApplicationController
  def index
    @remote_ip = request.env['HTTP_X_FORWARDED_FOR'].split(/ /)[0].chomp(",")

    render text: "#{@remote_ip}\n"
  end
end
