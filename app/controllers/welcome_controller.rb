class WelcomeController < ApplicationController
  def index
    if request.env["HTTP_X_FORWARDED_FOR"]
      @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    else
      @remote_ip = request.env['REMOTE_ADDR']
    end

    render text: "#{@remote_ip}\n"
  end
end
