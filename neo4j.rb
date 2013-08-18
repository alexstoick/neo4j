require 'neography'

Neography.configure do |config|
  config.protocol       = "http://"
  config.server         = "37.139.8.146"
  config.port           = 7474
  config.directory      = ""  # prefix this path with '/'
  config.cypher_path    = "/cypher"
  config.gremlin_path   = "/ext/GremlinPlugin/graphdb/execute_script"
  config.log_file       = "neography.log"
  config.log_enabled    = false
  config.max_threads    = 20
  config.authentication = nil  # 'basic' or 'digest'
  config.username       = nil
  config.password       = nil
  config.parser         = MultiJsonParser
end

neo = Neography::Rest.new ({
	  :server  => "37.139.8.146"
	})



# node1 = neo.create_node( "name" => "Alex" , "age" => 19 )
# node2 = neo.create_node( "name" => "Vlad" , "age" => 17 )
# node3 = neo.create_node( "name" => "Tata" , "age" => "57")

 node1 = Neography::Node.load(1)
 node2 = Neography::Node.load(2)
 node3 = Neography::Node.load(3)

neo.add_label( node2 , "feed" )
neo.add_label( node3 , "feed" )

#neo.add_label ( node)

puts neo.list_labels
# new_rel = Neography::Relationship.create( :father , node3 , node1 )
# new_rel = Neography::Relationship.create( :father , node3 , node2 )

#node1.both(:brother) << node2

#puts node1[:age] + "33"
#puts node

# new_rel = Neography::Relationship.create( :coding_buddies , node1 , node2 )

# puts new_rel

# node1.rels.incoming.map do |n|
# 	p n.rel_type
# 	p n.start_node
# end

# SELECT newssources.url , newsgroups.user_id , users.id
# FROM `group_entries` ,`newssources` , `newsgroups`
# JOIN `users`
# ON users.id = newsgroups.user_id
# WHERE 
# newssources.id = group_entries.newssource_id
