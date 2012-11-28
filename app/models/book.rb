class Book < ActiveRecord::Base
  attr_accessible :email, :isbn, :price, :title
end
