require 'uri'
require 'net/http'
require 'json'
require 'httparty'
require_relative '../config/application'

class App
  def font_list
    response = HTTParty.get('https://www.googleapis.com/webfonts/v1/webfonts?key=' + Application.new.google_api)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    mydata = JSON.parse(response)
    final_data = mydata["items"]
    final_data.collect{|data| [data["family"], "'#{data["family"]}', #{data["category"]}"]}
  end

  def second_fonts
    response = HTTParty.get('https://www.googleapis.com/webfonts/v1/webfonts?key=' + Application.new.google_api)
    final_data = response["items"]
    final_data.collect{|data| [data["family"], "'#{data["family"]}', #{data["category"]}"]}
  end
end

output = App.new
# puts output.font_list
puts output.second_fonts
