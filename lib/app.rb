require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)
toys_data = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "

# store all brands for later iteration
brands = []

# For each product in the data set:
products_hash["items"].each do |product|
  brands.push(product["brand"]) unless brands.include? product["brand"]

  # Print the name of the toy
  puts "Title: #{product["title"]}"

  # Print the retail price of the toy
  # Convert to float, since it's stored as string in JSON
  retail_price = product["full-price"].to_f
  puts "Retail Price: #{retail_price}"

  # Calculate and print the total number of purchases
  total_purchases = product["purchases"].length
  puts "# of purchases: #{total_purchases}"

  # Calcalate and print the total amount of sales
  # Did not include shipping in this total
  total_sales = 0.0
  product["purchases"].each do |purchase|
    total_sales = total_sales + purchase["price"]
  end
  puts "Total Sales: #{total_sales}"

  # Calculate and print the average price the toy sold for
  # Did not include shipping in this average
  average_price = total_sales / total_purchases
  puts "Average Price: #{average_price}"


  # Calculate and print the average discount based off the average sales price
  # Did not include shipping in this total
  average_discount = retail_price - average_price
  puts "Average Discount: #{average_discount}"
  puts
end



	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
