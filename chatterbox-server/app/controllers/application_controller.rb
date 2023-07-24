class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/' do
    "Hello World"
  end
  get '/messages' do
    messages= Message.all
    messages.to_json
  end
  get '/messages/:id' do
    message= Message.find(params[:id])
    message.to_json
  end
  post '/messages' do
    new_message= Message.create(username: params[:username], body: params[:body])
    new_message.to_json
  end
  patch '/messages/:id' do
    message= Message.find(params[:id])
    message.update(username: params[:username], body: params[:body])
    message.save
    message.to_json
  end
  delete '/messages/:id' do
    message= Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
