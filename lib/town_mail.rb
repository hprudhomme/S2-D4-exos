require 'nokogiri'
require 'open-uri'

page_town_name = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

town_name_array1 = page_town_name.xpath('//a[@class="lientxt"]')

x = 0
town_name_array2 = []
while x < town_name_array1.length
    town_name_array2[x] = town_name_array1[x].text
    x += 1
end

town_name_array3 = []
town_name_array3 = town_name_array2.map!{ |k| k.tr(' ', '-') }

town_name_array = []
town_name_array = town_name_array3.map!{ |k| k.downcase} #tab final nom communes

x = 0
town_mail_array = []
while x < town_name_array.length
    page_town = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/95/#{town_name_array[x]}.html"))
    town_mail_array[x] = page_town.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    x += 1
end

x = 0
town_mail_array2 = []
while x < town_mail_array.length
    town_mail_array2[x] = town_mail_array[x].text
    x += 1
end

myhash = Hash.new
town_name_array.each_with_index{|k,i|myhash[k] = town_mail_array2[i]}


a = []
x = 0
while x < town_name_array.length
    town_keys = myhash.keys
    town_value = myhash.values
    town_data_hash = { town_keys[x] => town_value[x]}
    a[x] = town_data_hash
    x += 1
end

puts a


