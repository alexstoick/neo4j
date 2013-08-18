# urls.each do |url|

# 	puts url
# 	node = Neography::Node.create( "url" => url )
# 	neo.add_label( node , "feed" )

# end

#puts neo.get_schema_index("feed")

# neo.get_nodes_labeled("feed")

# neo.get_nodes_labeled("feed").each do |node|

# 	p node
# 	#p node["data"]["url"]
# 	neo.add_node_to_index( "default" , "url" , node["data"]["url"] , node)
# end

#neo.create_node_index( "default" , "exact", "lucene" )

# puts neo.get_node_auto_index( "url" , "http://www.hotnews.ro/rss" )

#puts neo.list_node_indexes

# user = Neography::Node.find( "users" , "id" , 21 )

# puts user.nil?

# urls.each do |url|
# 	feed = Neography::Node.find( "default" , "url" , url )
# 	puts feed.neo_id
# 	feed.outgoing(:subscribed) << user
# end



# urls = [
# 	"http://www.hotnews.ro/rss" ,
# 	"http://www.hotnews.ro/rss/sport" ,
# 	"http://www.hotnews.ro/rss/life" ,
# 	"http://www.hotnews.ro/rss/revista",
# 	"http://www.theverge.com/rss/index.xml"
# 	]

