require 'nokogiri'

html = File.open('scrape.html', 'r') do |f|
    f.read
end    
#nokogiriを通じて変数に取得したhtmlを格納
doc = Nokogiri::HTML::parse(html, nil, 'utf-8')
#docに格納されたhtmlのうちh1タグのついているhtmlを取得
nodes = doc.xpath('//td')
#ppは見やすく出力するために用意されたメソッド
nodes.each {|node| pp node}
