puts 'Removing the restaurants...'
Restaurant.destroy_all
puts 'removing all the users...'
User.destroy_all

CHEFS = %w[Ameesha Andrew Anne Arthur Cai Connor Daniel🇸🇪 Daniel🇺🇸 Dave Donald Fontain Gui Joyce Joe Juan Jun Lucca Markus Fumi Mathieu Matthew Mei Philip Phu Rashon Rika Ryo Stefano Taylor Tsubasa X'Zaiver Yin]
CATEGORIES = %W[burger burgers ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

puts "Creating users..."
users = [
  {
    username: 'ameeeesha',
    email: 'ameesha@me.com'
  },
  {
    username: 'markus-c-n',
    email: 'markus@me.com'
  }
]

users.each do |user_hash|
  user = User.new(user_hash)
  user.password = 'secret'
  user.save!
end

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: get_category(restaurant_name),
    chef_name: name,
    user: User.all.sample
  )
end
puts "...created #{Restaurant.count} restaurants"
