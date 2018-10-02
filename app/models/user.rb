class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  def as_json(options={})
		h = super(options)
		h[:name] = h[:name]
		h
	end
end
