# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

#io = OpenURI.open_uri('http://www.nogizaka46.com')

 
# スクレイピング先のURL
url = 'http://www.nogizaka46.com'

opt = {}
#User-Agentの偽装
opt['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv 11.0) like Gecko'


charset = nil
html = open(url, opt) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//div[@class="today"]').each do |node|
#doc.xpath('//li[@class="clearfix noborder"]').each do |node|

    p node.css('a').inner_text
    
  end
