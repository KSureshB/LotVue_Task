class User < ActiveRecord::Base
	has_many :roles

	 validates :first_name, :email, presence: true
	 validates :email, uniqueness: true
	     validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create



end
