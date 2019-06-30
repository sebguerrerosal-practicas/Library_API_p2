require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  def index
     render json: Author.all 
  end
  
  def create
      author = Author.new(params_author)
      if author.save
          render json: author, status: 201
      else
          render json: author.errors, status: :unprocessable_entity
      end
  end
  
  def params_author
      params.require(:author).permit(:name)
  end
  
  #GET
  def index
      authors = Author.all
      render json:authors, status:200
  end
  
  #GET
  def show
      author = Author.find(params[:id])
      render json: author, status: 200
  end
  
  #POST
  def create
      author = Author.new(author_params)
      if author.save
          render json: author, status: 201
      else
          render json: author.errors, status: :unprocessable_entity
      end
  end
  
  #PUT/PATCH
  def update
      author = Author.find(params[:id])
      if author.update(author_params)
          render json: author, status: 201
      else
          render json: author.errors, status: :unprocessable_entity
      end
  end
  
  #DELETE
  def destroy
  end
  
  def author_params
      params.require(:author).permit(:name, :age)
  end
end
