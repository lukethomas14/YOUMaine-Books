class Book < ActiveRecord::Base
  attr_accessible :email, :isbn, :price, :title

  validates :isbn, :presence => true
  validates :price, :presence => true
  validates :title, :presence => true
  validates :email, :presence => true

  validates :isbn, :isbn_format => true

  def self.search(search)
		if search
			where('isbn LIKE ?', "%#{search}")
		else
			all
		end
	end

  validates :email, :format => { :with => /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.[Ee][Dd][Uu]$/, :message => "Only .EDU email addresses allowed"}
end
