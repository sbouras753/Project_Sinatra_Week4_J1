 require 'csv'

class Gossip 
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end 

	def save
    	CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
  		end
	end

	def self.all
  		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  	return all_gossips
	end

	def self.find(id)
		all_gossips = self.all
		all_gossips[id.to_i - 1]
	end

	def self.edit(id, gossip_new_author, gossip_new_content)
		all_gossips = self.all
		puts all_gossips
  	    all_gossips[id] = [gossip_new_author, gossip_new_content]
  	    puts all_gossips[id]
  	return all_gossips
	end


end 
