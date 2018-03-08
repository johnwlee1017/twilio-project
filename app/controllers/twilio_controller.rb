get '/twilio' do

  erb :'twilio/index'
end

post '/twilio' do
  p params

  @message = params[:message]

  p params[:friends]

<<<<<<< HEAD
=======
  account_sid = #hidden
  auth_token = #hidden
>>>>>>> 1c8c860394090aa512ff153f61bd7b4b30f54300
  client = Twilio::REST::Client.new account_sid, auth_token
  
  from = '+14159148891' 
  
  # friends = {
  #   '+16618771576' => 'John',
  #   '+15305518459' => 'Kanji',
  #   '+15109658997' => 'Anson'
  # }

  friends = params[:friends]
  
  friends.each do |key, value|
    client.messages.create(
      from: from,
      to: key,
      body: "Hey #{value}, #{@message}!"
    )
    puts "Sent message to #{value}"
  end

  redirect '/twilio'

end
