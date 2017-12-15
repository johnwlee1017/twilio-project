get '/twilio' do

  erb :'twilio/index'
end

post '/twilio' do
  p params

  @message = params[:message]

  p params[:friends]

  account_sid = 'AC5799dc5884c889fbb6a4d97c295d3a42'
  auth_token = 'f80a5f01aac6879c67a524856c97e10a'
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