namespace :dev do
  desc "COnfigura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Resetando o banco de dados..."
		# %x(rails db:drop db:create db:migrate)

    puts "Cadastrando tipos de contatos..."
		
		kinds = %w(Amigo Comercial Conhecido)

		kinds.each do |kind|
			Kind.create!(
				description: kind
			)
		end

		puts "Tipos criados com sucesso"
  	puts "Cadastrando os contatos"
  	100.times do ||
  		Contact.create!(
  			name:Faker::Name.name,
  			email:Faker::Internet.email,
  			birthdate:Faker::Date.between(65.years.ago, 18.years.ago),
  			kind: Kind.all.sample
  		)
  	end
  	puts "Usuários cadastrados com sucesso."

  	puts "Cadastrando os Telefones"
  	Contact.all.each do |contact|
  		Random.rand(5).times do |i|
  			phone = Phone.create(number:Faker::PhoneNumber.cell_phone)
  			contact.phones << phone
  			contact.save!
  		end
  	end
  	puts "Telefones cadastrados com sucesso!"

    puts "Cadastrando os Endereços"
    Contact.all.each do |contact|
      Address.create(
        street:Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Endereços cadastrados com sucesso!"
  end
end
