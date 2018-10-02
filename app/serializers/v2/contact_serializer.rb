module V2
	class ContactSerializer < ActiveModel::Serializer
	  attributes :id, :name, :email, :birthdate

	  belongs_to :kind do
	  	link(:related){v2_contact_kind_url(object.id)}
	  end

		has_many :phones do
			link(:related){v2_contact_phones_url(object.id)}
		end

		has_one :address do
			link(:related){v2_contact_address_url(object.id)}
		end

		meta do
			{author:"Lucas de Albuquerque"} 
		end

		def attributes(*args)
			h = super(*args)
			h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
			h
		end
	end
end