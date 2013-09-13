
var neo4j_lib = require ( 'neo4j' ) ;
var async = require ( 'async' ) ;
var db = new neo4j_lib.GraphDatabase ( "http://37.139.8.146:7474" ) ;

subscribers = [] ;

query = db.getIndexedNodes ( "feed" , "id" , 114 , function ( err , res ) {

	console.log ( res[0].toString() )
	node = res[0] ;
	node.outgoing ( "subscribed" , function ( err , res ) {

		async.each ( res , processRelationship , function ( err) {
			if ( err )
				console.log ( err ) ;
			}) ;
		//object = { "count" : subscribers.length }
	})
})


function processRelationship ( item , callback )
{


	user = item.end ;
	console.log ( user.data ) ;
	var u = new Node(user) ;
	console.log ( u.data ) ;
	//console.log ( item.start + " " + item.type + " "+ item.end.data["user_id"] )
	//subscribers.push ( item.end.user_id ) ;
	callback(null);
}