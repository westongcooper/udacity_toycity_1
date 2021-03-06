require 'json'

path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

puts "\nDate: " + Time.new.strftime("%B %d, %Y")

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

puts "\n"
products_hash["items"].each do |item|
  sales_count = item['purchases'].count

  puts "Name: #{item['title']}"
  puts "Retail price: $#{item['full-price']}"
  puts "Number of purchases: #{sales_count}"

  total_item_sales = item['purchases'].inject(0) do |sum, sale|
    sum += sale["price"]
  end

  average_sale_price = total_item_sales / sales_count
  average_discount_percent = (1 - (average_sale_price / item['full-price'].to_f)) * 100

  puts "Total sales amount: $#{total_item_sales}"
  puts "Average price of each product: $#{average_sale_price}"
  puts "Average discount: #{average_discount_percent.round(1)}%"
  puts "\n"
end


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts


brands = {}
products_hash["items"].each do |item|
    (brands[item["brand"]] ||= []) << item
end

brands.each do |brand,toys|
  brand_toys_total_cost = brand_revenue = toys_in_stock = 0

  puts "Brand: #{brand}"

  toys.each do |toy|
    brand_toys_total_cost += toy["full-price"].to_f
    toys_in_stock += toy["stock"]
    brand_revenue += toy["purchases"].inject(0) do |sum, sale|
      sum += sale["price"]
    end
  end

  average_price = brand_toys_total_cost / toys.count

  puts "Number of Toys in stock: #{toys_in_stock}"
  puts "Average price of each toy: $#{average_price.round(2)}"
  puts "Total revenue of all toys: $#{brand_revenue.round(2)}"
  puts "\n"
end
