require 'nokogiri'
require 'open-uri'
require 'net/http'

def get_from(url)
    #url = 'https://baseball-data.com/player/s/'
    uri = URI(url)
    return html = Net::HTTP.get(uri)
end    

def write_file(path, text)
    File.open(path, 'w') do |file|
        file.write(text)
    end
end

html = File.open("scrape.html", 'r'){|f| f.read}
doc = Nokogiri::HTML::parse(html, nil, 'utf-8')
player_info = []
doc.xpath('//*[@id="tbl"]/tbody/tr/td').each do |info|
    player_info << info.text
end    

require 'json'
puts player_info
player_info = {player_info: player_info}.to_json
File.open('player_info.json', 'w'){|f| f.write(player_info)}