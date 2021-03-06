
#include "Domain.h"

namespace parser { namespace pddl {

void Not::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( NOT ";
	if ( cond ) cond->PDDLPrint( s, 0, ts, d );
	s << " )";
}

void Not::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	f.next();
	f.assert_token( "(" );

	std::string s = f.getToken();
	int i = d.preds.index( s );

	if ( s == "=" ) cond = new Equals;
	else if ( i < 0 ) f.tokenExit( s );
	else cond = new Ground( d.preds[i] );

	cond->parse( f, ts, d );

	f.next();
	f.assert_token( ")" );
}


} } // namespaces