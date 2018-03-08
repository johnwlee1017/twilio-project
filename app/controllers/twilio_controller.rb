get '/twilio' do

  erb :'twilio/index'
end

post '/twilio' do
  p params

  @message = params[:message]

  p params[:friends]

  account_sid = #hidden
  auth_token = #hidden
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
