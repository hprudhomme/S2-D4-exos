require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

crypto_name_array = page.xpath('//tr/td/a[@class="currency-name-container link-secondary"]')
crypto_value_array = page.xpath('//tr/td/a[@class="price"]')

x = 0
crypto_name_array2 = []
while x < crypto_name_array.length
    crypto_name_array2[x] = crypto_name_array[x].text
    x += 1
end

x = 0
crypto_value_array2 = []
while x < crypto_value_array.length
    crypto_value_array2[x] = crypto_value_array[x].text
    x += 1
end
crypto_value_array3 = crypto_value_array2.map!{ |k| k.tr('$', '') }
crypto_value_to_f = crypto_value_array3.map(&:to_f)


myhash = Hash.new
crypto_name_array2.each_with_index{|k,i|myhash[k] = crypto_value_to_f[i]}
# puts myhash

a = []
x = 0
while x < crypto_name_array2.length
    crypto_keys = myhash.keys
    crypto_value = myhash.values
    crypto_data_hash = { crypto_keys[x] => crypto_value[x]}
    a[x] = crypto_data_hash
    x += 1
end
puts crypto_name_array2[2398]
puts a[2393]

# crypto_keys = myhash.keys
# crypto_value = myhash.values
# puts crypto_data_hash = { crypto_keys[0] => crypto_value[0]}





