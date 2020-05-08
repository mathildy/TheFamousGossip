class CommentController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @comments = Comment.all
  end
  
  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @comment = Comment.find(params[:id])
  
  end
  
  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @comment = Comment.new
  end
  
  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @comment =  Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:id])
    if @comment.save # essaie de sauvegarder en base @user
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      redirect_to gossip_path(params[:id])
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      render "/"
    end
  end 
  
  
  def edit
    @comment = Comment.find(params[:id])

  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
        redirect_to "/"
    else
        render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end
  
end
