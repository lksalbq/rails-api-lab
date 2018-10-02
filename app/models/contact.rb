class Contact < ApplicationRecord
	paginates_per 5

	#validations
	validates_presence_of :kind
	# validates_presence_of :address

	# Associations
	belongs_to :kind
	has_many :phones
	has_one :address

	accepts_nested_attributes_for :phones, allow_destroy: true
	accepts_nested_attributes_for :address, update_only: true

	# def birthdate_br
	# 	I18n.l(self.birthdate) unless self.birthdate.blank?
	# end

	# def author
	# 	"Lucas Albuquerque"
	# end

	# def kind_description
	# 	self.kind.description
	# end

	def as_json(options={})
		h = super(options)
		h[:birthdate] = I18n.l(self.birthdate) unless self.birthdate.blank?
		h
	end
end
