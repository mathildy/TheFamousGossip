class CityController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @cities = City.all
  end
  
  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @city = City.find(params[:id])
    @gossips_city = City.find(params[:id]).gossips
  end
  
  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @city = City.new
  end
  
  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @city = City.new(name: params[:name], zip_code: params[:zip_code])
  end
    
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
