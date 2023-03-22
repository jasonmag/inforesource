# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'rest-client'

puts 'Start Dummyjson User Data'

def get_dummyjson_user
    users = RestClient.get("https://dummyjson.com/users")
    user_list = JSON.parse(users)["users"]

    user_list.each do |user|
        parse = user.deep_transform_keys { |k| k.underscore }

        # create address
        if parse["address"]
            user_address = create_address(parse)
            parse["addresses_id"] = user_address[:id]
            parse.delete("address")
        end

        # create hair
        if parse["hair"]
            parse["hair"]["type_name"] = parse["hair"].delete "type"
            hair = UserHair.create(parse["hair"])
            parse["user_hairs_id"] = hair[:id]
            parse.delete("hair")
        end

        # create bank
        if parse["bank"]
            bank = UserBank.create(parse["bank"])
            parse["user_banks_id"] = bank[:id]
            parse.delete("bank")
        end

        # create company
        if parse["company"]
            user_company = create_company(parse)
            parse["user_companies_id"] = user_company[:id]
            parse.delete("company")
        end
        
        p parse
        User.create(parse)
    end
end

# create address
def create_address(parse)
    address = parse["address"]
    # create coordinates
    if address["coordinates"]
        coordinate = AddressCoordinate.create(address["coordinates"])
        address["address_coordinates_id"] = coordinate[:id]
        address.delete("coordinates")
    end
    address["address_name"] = address.delete "address"
    Address.create(address)
end

# create company
def create_company(parse)
    company = parse["company"]
    company_address = create_address(company)
    company["addresses_id"] = company_address[:id]
    company.delete("address")
    UserCompany.create(company)
end

get_dummyjson_user()

puts 'End Dummyjson User Data'
