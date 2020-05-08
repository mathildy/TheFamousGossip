class UserController < ApplicationController

def index
  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  @users = User.all
end

def show
  # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  @user = User.find(params[:id])

end

def new
  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  @user = User.new
end

def create
  @city = City.all.sample.id
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: @city, password: params[:pass_first], password_confirmation: params[:pass_second]) 

  if @user.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    log_in(@user)
    puts "Tu as réussi"
    redirect_to "/"
  else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    puts "ca ne fontionne pas"
    render new_user_path
  end
end

def edit
end

def update
end

def destroy
end

end
