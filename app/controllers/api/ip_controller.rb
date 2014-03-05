class Api::IpController < ApplicationController
  def index

    @remote_ip = request.env['HTTP_X_FORWARDED_FOR'].split(/ /)[0].chomp(",")

    @country = GeoIP.new('/var/www/whoami/shared/GeoIP.dat').country(@remote_ip)
    @city    = GeoIP.new('/var/www/whoami/shared/GeoLiteCity.dat').city(@remote_ip)
    @asn     = GeoIP.new('/var/www/whoami/shared/GeoIPASNUM.dat').asn(@remote_ip)

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