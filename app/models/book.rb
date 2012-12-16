class Book < ActiveRecord::Base

  attr_accessible :email, :isbn, :price, :title, :course_number, :captcha, :captcha_key

  validates :isbn, :presence => true
  validates :price, :presence => true
  validates :title, :presence => true
  validates :email, :presence => true
  validates :course_number, :presence => true
  validates_length_of :course_number, :maximum => 6

  validates :isbn, :isbn_format => true

  def self.search(search)
		if search
      q = "%#{search}".capitalize
			where('course_number LIKE ? OR isbn LIKE ?', q, q).order("created_at DESC")
		else
			all
		end
	end

  validates :email, :format => { :with => /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.[Ee][Dd][Uu]$/, :message => "Only .EDU email addresses allowed"}
end
