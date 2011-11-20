class Usr < ActiveRecord::Base

	has_many :services, :dependent => :destroy

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  	validates_uniqueness_of :usr_id  
  	validates :name, :presence => true,:length => {:maximum => 50}       
  	validates :email, :presence => true,:format   => { :with => email_regex }
  	
end
