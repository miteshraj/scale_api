require 'unirest'
require 'scale'
scale = Scale.new(api_key: 'test_9e5d24aef78b4ac28641c08044e4584c')


while true
  system "clear"

  puts "Let's use Scale API!"
  puts "Enter 1 to analyze an image"
  input_option = gets.chomp

   if input_option == "1"
    params = {}
    puts "Please enter a callback URL:"
    params["callback_url"] = gets.chomp
    puts "Please enter an image URL to analye:"
    params["attachment"] = gets.chomp
    puts "Please enter an array of string describing which objects you’d like bounding boxes to be drawn around: "
    params["objects_to_annotate"] = gets.chomp
    response = Unirest.post("http://localhost:3000/images", parameters: params)
    image = response.body
	end
end