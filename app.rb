require 'sinatra/base'
require_relative './lib/game.rb'
class RockPaperScissors < Sinatra::Base

  ['/weapons', '/outcome'].each do |path|
    before path do
      @game = session[:game]
    end
  end

  enable :sessions

  get '/' do
    erb :sign_in
  end

  post '/sign_in' do
    player_one_name = params[:player_one_name]
    player_two_name = params[:player_two_name]
    session[:game] = Game.new(players: [player_one_name, player_two_name])
    redirect '/weapons'
  end
  
  get '/weapons' do
    @current_player = @game.current_player
    erb :weapons
  end

  post '/weapons' do
    @game.player_weapon = params[:weapon]
    if @game.pending_weapon_choice?
      redirect '/weapons'
    else
      redirect '/outcome'
    end
  end

  get '/outcome' do
    @game.player_weapon = session[:weapon]
    @outcome = @game.outcome
    erb :outcome
  end

  run! if app_file == $0
end
