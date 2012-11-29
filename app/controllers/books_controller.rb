class BooksController < ApplicationController

	def index
		@books = Book.search(params[:search])
	end

	def new
		@book = Book.new
	end

	def create 
		@book = Book.new(params[:book])

		if @book.save 
			flash[:notice] = "Thanks! We'll be in touch soon."
			redirect_to new_book_path

		else flash.now[:error] = "There was a problem with the info you supplied"
		render 'books/new'
		end
	end	
end

