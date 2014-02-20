class Api::IpController < ApplicationController
  def index

    if request.env["HTTP_X_FORWARDED_FOR"]
      @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    else
      @remote_ip = request.env['REMOTE_ADDR']
    end

    @country = GeoIP.new('/Users/thom4262/ruby/whoami/GeoIP.dat').country(@remote_ip)
    @city    = GeoIP.new('/Users/thom4262/ruby/whoami/GeoLiteCity.dat').city(@remote_ip)
    @asn     = GeoIP.new('/Users/thom4262/ruby/whoami/GeoIPASNUM.dat').asn(@remote_ip)

    respond_to do |format|

      msg = {
        :remote_ip => @remote_ip,
        :source_ip => request.env['REMOTE_ADDR'],
        :X_Forwarded => request.env["HTTP_X_FORWARDED_FOR"],
        :country => @country,
        :city => @city,
        :asn => @asn
      }

      format.json { render :json => msg}
      format.html { render :html => @remote_ip}
      
    end
  end
end