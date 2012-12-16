class BooksController < ApplicationController

	def index
		@books = Book.search(params[:search])
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create 
		@book = Book.new(params[:book])	
		
		if @book.save
			redirect_to @book, notice: 'Book was successfully created.'

		else flash.now[:error] = "There was a problem with the info you supplied"
			render 'books/new'
		end

		if @book.save && verify_recaptcha(:model => @book, :message => "Oh! It's error with reCAPTCHA!") #captcha is valid 
			else #captcha is invalid 
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to books_url
	end	
end

