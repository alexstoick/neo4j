require 'neography'

Neography.configure do |config|
  config.protocol       = "http://"
  config.server         = "37.139.8.146"
  config.port           = 7474
  config.directory      = ""  # prefix this path with '/'
  config.cypher_path    = "/cypher"
  config.gremlin_path   = "/ext/GremlinPlugin/graphdb/execute_script"
  config.log_file       = "@neography.log"
  config.log_enabled    = false
  config.max_threads    = 20
  config.authentication = nil  # 'basic' or 'digest'
  config.username       = nil
  config.password       = nil
  config.parser         = MultiJsonParser
end

@neo = Neography::Rest.new()

def get_feed ( url )

	feed = Neography::Node.find( "default" , "url" , url )

	if ( feed.nil? )
		puts "Feed does not exist"

		feed = Neography::Node.create( "url" => url )
		@neo.add_node_to_index( "default" , "url" , url , feed )
		@neo.add_label( feed , "feed" )

		puts "Created feed with id " + feed.neo_id

		return feed
	else
		puts "Feed exists with id " + feed.neo_id
		return feed
	end

end

def get_user ( id )
	user = Neography::Node.find( "users" , "id" , id )

	if ( user.nil? )
		puts "User does not exist"

		user = Neography::Node.create( "id" => id )
		@neo.add_node_to_index( "users" , "id" , id , user )
		@neo.add_label( user , "user")

		puts "Created user with id " + user.neo_id

		return user
	else
		puts "User exists with id " + user.neo_id
		return user
	end
end

def create_relationship ( feed , user )
	if ( @neo.get_node_relationships_to( feed, user ).nil? )
		feed.outgoing(:subscribed) << user
		puts "Created relationship"
	else
		puts "Relationship exists"
	end
end

user = get_user(23)
feed = get_feed("http://www.theverge.com/rss/index.xml")

create_relationship( feed , user )
