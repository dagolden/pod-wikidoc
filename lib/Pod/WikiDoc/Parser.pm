package Pod::WikiDoc::Parser;
use Parse::RecDescent;

{ my $ERRORS;


package Parse::RecDescent::Pod::WikiDoc::Parser;
use strict;
use vars qw($skip $AUTOLOAD  );
$skip = '';


{
local $SIG{__WARN__} = sub {0};
# PRETEND TO BE IN Parse::RecDescent NAMESPACE
*Parse::RecDescent::Pod::WikiDoc::Parser::AUTOLOAD	= sub
{
	no strict 'refs';
	$AUTOLOAD =~ s/^Parse::RecDescent::Pod::WikiDoc::Parser/Parse::RecDescent/;
	goto &{$AUTOLOAD};
}
}

push @Parse::RecDescent::Pod::WikiDoc::Parser::ISA, 'Parse::RecDescent';
# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Chunk
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Chunk"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Chunk]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [WhiteSpace]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [WhiteSpace]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::WhiteSpace($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [WhiteSpace]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [WhiteSpace]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{WhiteSpace}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [WhiteSpace]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [InlineCode]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [InlineCode]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::InlineCode($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [InlineCode]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [InlineCode]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{InlineCode}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [InlineCode]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [BoldText]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [BoldText]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::BoldText($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [BoldText]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [BoldText]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{BoldText}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [BoldText]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [ItalicText]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [ItalicText]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::ItalicText($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [ItalicText]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [ItalicText]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{ItalicText}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [ItalicText]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [LinkText]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [LinkText]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::LinkText($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [LinkText]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [LinkText]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{LinkText}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [LinkText]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [EscapedChar]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [EscapedChar]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::EscapedChar($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [EscapedChar]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [EscapedChar]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{EscapedChar}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [EscapedChar]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [RegularText]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[6];
		$text = $_[1];
		my $_savetext;
		@item = (q{Chunk});
		%item = (__RULE__ => q{Chunk});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [RegularText]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Chunk},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::RegularText($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [RegularText]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Chunk},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [RegularText]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{RegularText}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [RegularText]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Chunk},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Chunk},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Chunk},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Chunk},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Paragraph
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Paragraph"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Paragraph]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Paragraph},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Plain_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Paragraph},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Paragraph});
		%item = (__RULE__ => q{Paragraph});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Plain_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Paragraph},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Plain_Line, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Plain_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Paragraph},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Plain_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Paragraph},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Plain_Line(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Paragraph},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( q{}, @{$item[1]} )
                        ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Plain_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Paragraph},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Paragraph},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Paragraph},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Paragraph},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Paragraph},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::ItalicText
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"ItalicText"};
	
	Parse::RecDescent::_trace(q{Trying rule: [ItalicText]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{ItalicText},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: []},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{ItalicText},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{ItalicText});
		%item = (__RULE__ => q{ItalicText});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{ItalicText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { extract_delimited( $text, '~' ) };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{ItalicText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION2__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: []<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{ItalicText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{ItalicText},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{ItalicText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{ItalicText},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{ItalicText},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Block
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Block"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Block]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Header]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Header]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Header($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Header]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Header]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Header}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Header]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Unordered_List]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Unordered_List]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Unordered_List($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Unordered_List]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Unordered_List]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Unordered_List}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Unordered_List]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Ordered_List]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[2];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Ordered_List]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Ordered_List($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Ordered_List]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Ordered_List]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Ordered_List}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Ordered_List]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Preformat]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[3];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Preformat]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Preformat($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Preformat]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Preformat]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Preformat}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Preformat]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Paragraph]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[4];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Paragraph]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Paragraph($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Paragraph]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Paragraph]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Paragraph}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Paragraph]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Empty_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[5];
		$text = $_[1];
		my $_savetext;
		@item = (q{Block});
		%item = (__RULE__ => q{Block});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Block},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Empty_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Block},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Empty_Line]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Empty_Line}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Empty_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Block},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Block},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Block},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Block},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Numbered_Line
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Numbered_Line"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Numbered_Line]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Numbered_Line},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^0[\\t\\ ]*\\n/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Numbered_Line});
		%item = (__RULE__ => q{Numbered_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^0[\\t\\ ]*\\n/]}, Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^0[\t\ ]*\n)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return =  q{} };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^0[\\t\\ ]*\\n/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^0[\\t\\ ]+/ /[^\\n]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{Numbered_Line});
		%item = (__RULE__ => q{Numbered_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^0[\\t\\ ]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^0[\t\ ]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^0[\\t\\ ]+/ /[^\\n]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Numbered_Line},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Numbered_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Numbered_Line},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Numbered_Line},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Bullet_Item
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Bullet_Item"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Bullet_Item]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Bullet_Item},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Bullet_Line List_Continuation]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Bullet_Item});
		%item = (__RULE__ => q{Bullet_Item});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Bullet_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Bullet_Item},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Bullet_Line($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Bullet_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Bullet_Item},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Bullet_Line]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Bullet_Line}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [List_Continuation]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Bullet_Item},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{List_Continuation})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::List_Continuation, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [List_Continuation]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Bullet_Item},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [List_Continuation]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{List_Continuation(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\n", $item[1],  @{$item[2]} ) ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Bullet_Line List_Continuation]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Bullet_Item},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Bullet_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Bullet_Item},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Bullet_Item},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::LinkTarget
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"LinkTarget"};
	
	Parse::RecDescent::_trace(q{Trying rule: [LinkTarget]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{LinkTarget},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/.+/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{LinkTarget},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{LinkTarget});
		%item = (__RULE__ => q{LinkTarget});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/.+/]}, Parse::RecDescent::_tracefirst($text),
					  q{LinkTarget},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:.+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkTarget},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/.+/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkTarget},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{LinkTarget},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{LinkTarget},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{LinkTarget},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{LinkTarget},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Plain_Line
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Plain_Line"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Plain_Line]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Plain_Line},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^[^*0\\n\\t\\ ]|[*0][^\\t\\ ]/ /[^\\n]+/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Plain_Line});
		%item = (__RULE__ => q{Plain_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^[^*0\\n\\t\\ ]|[*0][^\\t\\ ]/]}, Parse::RecDescent::_tracefirst($text),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^[^*0\n\t\ ]|[*0][^\t\ ])//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]+/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return =  $item[1] . $item[2] . $item[3] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^[^*0\\n\\t\\ ]|[*0][^\\t\\ ]/ /[^\\n]+/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Plain_Line},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Plain_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Plain_Line},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Plain_Line},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::WhiteSpace
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"WhiteSpace"};
	
	Parse::RecDescent::_trace(q{Trying rule: [WhiteSpace]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{WhiteSpace},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [m\{ ^ \\s+ \}x]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{WhiteSpace},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{WhiteSpace});
		%item = (__RULE__ => q{WhiteSpace});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [m\{ ^ \\s+ \}x]}, Parse::RecDescent::_tracefirst($text),
					  q{WhiteSpace},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s{\A(?: ^ \s+ )}{}x)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{WhiteSpace},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [m\{ ^ \\s+ \}x]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{WhiteSpace},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{WhiteSpace},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{WhiteSpace},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{WhiteSpace},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{WhiteSpace},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Indent_Continuation
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Indent_Continuation"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Indent_Continuation]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Indent_Continuation},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Empty_Line Indented_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Indent_Continuation});
		%item = (__RULE__ => q{Indent_Continuation});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Indent_Continuation},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Empty_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Indent_Continuation},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Empty_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Empty_Line(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Indented_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Indent_Continuation},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{Indented_Line})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Indented_Line, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Indented_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Indent_Continuation},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Indented_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Indented_Line(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = [ @{$item[1]}, @{$item[2]} ] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Empty_Line Indented_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Indent_Continuation},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Indent_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Indent_Continuation},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Indent_Continuation},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Numbered_Item
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Numbered_Item"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Numbered_Item]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Numbered_Item},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Numbered_Line List_Continuation]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Numbered_Item});
		%item = (__RULE__ => q{Numbered_Item});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [Numbered_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Numbered_Item},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::Numbered_Line($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [Numbered_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Numbered_Item},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [Numbered_Line]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Numbered_Line}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying repeated subrule: [List_Continuation]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Numbered_Item},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{List_Continuation})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::List_Continuation, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [List_Continuation]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Numbered_Item},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [List_Continuation]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{List_Continuation(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( "\n", $item[1],  @{$item[2]} ) 
                        ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Numbered_Line List_Continuation]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Numbered_Item},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Numbered_Item},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Numbered_Item},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Numbered_Item},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Preformat
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Preformat"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Preformat]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Preformat},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Indented_Line Indent_Continuation Empty_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Preformat});
		%item = (__RULE__ => q{Preformat});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Indented_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Preformat},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Indented_Line, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Indented_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Preformat},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Indented_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Indented_Line(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Indent_Continuation]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Preformat},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{Indent_Continuation})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Indent_Continuation, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Indent_Continuation]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Preformat},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Indent_Continuation]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Indent_Continuation(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Preformat},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{Empty_Line})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Empty_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Preformat},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Empty_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Empty_Line(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => [ @{$item[1]}, map { @{$_} } @{$item[2]} ],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Indented_Line Indent_Continuation Empty_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Preformat},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Preformat},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Preformat},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Preformat},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Empty_Line"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Empty_Line},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^[\\t\\ ]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Empty_Line});
		%item = (__RULE__ => q{Empty_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^[\\t\\ ]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^[\t\ ]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^[\\t\\ ]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Empty_Line},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Empty_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Empty_Line},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Empty_Line},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Bullet_Line
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Bullet_Line"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Bullet_Line]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Bullet_Line},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^\\*[\\t\\ ]*\\n/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Bullet_Line});
		%item = (__RULE__ => q{Bullet_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^\\*[\\t\\ ]*\\n/]}, Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^\*[\t\ ]*\n)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = q{} };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^\\*[\\t\\ ]*\\n/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^\\*[\\t\\ ]+/ /[^\\n]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{Bullet_Line});
		%item = (__RULE__ => q{Bullet_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^\\*[\\t\\ ]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^\*[\t\ ]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[2] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^\\*[\\t\\ ]+/ /[^\\n]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Bullet_Line},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Bullet_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Bullet_Line},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Bullet_Line},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::InlineCode
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"InlineCode"};
	
	Parse::RecDescent::_trace(q{Trying rule: [InlineCode]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{InlineCode},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: []},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{InlineCode},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{InlineCode});
		%item = (__RULE__ => q{InlineCode});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{InlineCode},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { extract_bracketed( $text, '{' ) };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{InlineCode},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION2__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: []<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{InlineCode},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{InlineCode},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{InlineCode},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{InlineCode},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{InlineCode},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::LinkText
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"LinkText"};
	
	Parse::RecDescent::_trace(q{Trying rule: [LinkText]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{LinkText},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: []},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{LinkText},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{LinkText});
		%item = (__RULE__ => q{LinkText});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { extract_bracketed( $text, '[' ) };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = $thisparser->LinkContent( 
                        substr( substr( $item[1], 1), 0, -1 )
                    ),
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION2__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: []<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{LinkText},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{LinkText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{LinkText},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{LinkText},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Ordered_List
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Ordered_List"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Ordered_List]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Ordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Numbered_Item Empty_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Ordered_List});
		%item = (__RULE__ => q{Ordered_List});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Numbered_Item]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Ordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Numbered_Item, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Numbered_Item]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Ordered_List},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Numbered_Item]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Numbered_Item(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Ordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{Empty_Line})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Empty_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Ordered_List},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Empty_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Empty_Line(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Numbered_Item Empty_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Ordered_List},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Ordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Ordered_List},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Ordered_List},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::LinkLabel
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"LinkLabel"};
	
	Parse::RecDescent::_trace(q{Trying rule: [LinkLabel]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{LinkLabel},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^[^|]*/]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{LinkLabel},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{LinkLabel});
		%item = (__RULE__ => q{LinkLabel});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^[^|]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{LinkLabel},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^[^|]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkLabel},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( $item[1] ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^[^|]*/]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkLabel},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{LinkLabel},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{LinkLabel},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{LinkLabel},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{LinkLabel},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Inline
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Inline"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Inline]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Inline},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Chunk]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Inline},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Inline});
		%item = (__RULE__ => q{Inline});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Chunk]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Inline},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Chunk, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Chunk]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Inline},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Chunk]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Inline},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Chunk(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Inline},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Chunk]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Inline},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Inline},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Inline},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Inline},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Inline},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::List_Continuation
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"List_Continuation"};
	
	Parse::RecDescent::_trace(q{Trying rule: [List_Continuation]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{List_Continuation},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^[^*0\\s]/ /[^\\n]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{List_Continuation});
		%item = (__RULE__ => q{List_Continuation});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^[^*0\\s]/]}, Parse::RecDescent::_tracefirst($text),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^[^*0\s])//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = $item[1] . $item[2] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^[^*0\\s]/ /[^\\n]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{List_Continuation},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{List_Continuation},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{List_Continuation},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{List_Continuation},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::LinkContent
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"LinkContent"};
	
	Parse::RecDescent::_trace(q{Trying rule: [LinkContent]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{LinkContent},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [LinkLabel '\\|' LinkTarget]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{LinkContent});
		%item = (__RULE__ => q{LinkContent});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [LinkLabel]},
				  Parse::RecDescent::_tracefirst($text),
				  q{LinkContent},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::LinkLabel($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [LinkLabel]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{LinkContent},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [LinkLabel]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{LinkLabel}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying terminal: ['\\|']},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\|'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\|"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying subrule: [LinkTarget]},
				  Parse::RecDescent::_tracefirst($text),
				  q{LinkContent},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{LinkTarget})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::LinkTarget($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [LinkTarget]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{LinkContent},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [LinkTarget]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{LinkTarget}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {   
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1], $item[3] ],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [LinkLabel '\\|' LinkTarget]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [LinkTarget]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[1];
		$text = $_[1];
		my $_savetext;
		@item = (q{LinkContent});
		%item = (__RULE__ => q{LinkContent});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying subrule: [LinkTarget]},
				  Parse::RecDescent::_tracefirst($text),
				  q{LinkContent},
				  $tracelevel)
					if defined $::RD_TRACE;
		if (1) { no strict qw{refs};
		$expectation->is(q{})->at($text);
		unless (defined ($_tok = Parse::RecDescent::Pod::WikiDoc::Parser::LinkTarget($thisparser,$text,$repeating,$_noactions,sub { \@arg })))
		{
			
			Parse::RecDescent::_trace(q{<<Didn't match subrule: [LinkTarget]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{LinkContent},
						  $tracelevel)
							if defined $::RD_TRACE;
			$expectation->failed();
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched subrule: [LinkTarget]<< (return value: [}
					. $_tok . q{]},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{LinkTarget}} = $_tok;
		push @item, $_tok;
		
		}

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1] ],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [LinkTarget]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{LinkContent},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{LinkContent},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{LinkContent},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{LinkContent},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::EscapedChar
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"EscapedChar"};
	
	Parse::RecDescent::_trace(q{Trying rule: [EscapedChar]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{EscapedChar},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: ['E']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{EscapedChar});
		%item = (__RULE__ => q{EscapedChar});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: ['E']},
					  Parse::RecDescent::_tracefirst($text),
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "E"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { extract_bracketed( $text, '<' ) };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do {
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2]
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION2__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: ['E']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{EscapedChar},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{EscapedChar},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{EscapedChar},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{EscapedChar},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Unordered_List
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Unordered_List"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Unordered_List]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Unordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Bullet_Item Empty_Line]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Unordered_List});
		%item = (__RULE__ => q{Unordered_List});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Bullet_Item]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Unordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Bullet_Item, 1, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Bullet_Item]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Unordered_List},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Bullet_Item]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Bullet_Item(s)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Empty_Line]},
				  Parse::RecDescent::_tracefirst($text),
				  q{Unordered_List},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{Empty_Line})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Empty_Line, 0, 1, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Empty_Line]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{Unordered_List},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Empty_Line]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Empty_Line(?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Bullet_Item Empty_Line]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Unordered_List},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Unordered_List},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Unordered_List},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Unordered_List},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::WikiDoc
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"WikiDoc"};
	
	Parse::RecDescent::_trace(q{Trying rule: [WikiDoc]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{WikiDoc},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [Block]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{WikiDoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{WikiDoc});
		%item = (__RULE__ => q{WikiDoc});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying repeated subrule: [Block]},
				  Parse::RecDescent::_tracefirst($text),
				  q{WikiDoc},
				  $tracelevel)
					if defined $::RD_TRACE;
		$expectation->is(q{})->at($text);
		
		unless (defined ($_tok = $thisparser->_parserepeat($text, \&Parse::RecDescent::Pod::WikiDoc::Parser::Block, 0, 100000000, $_noactions,$expectation,undef))) 
		{
			Parse::RecDescent::_trace(q{<<Didn't match repeated subrule: [Block]>>},
						  Parse::RecDescent::_tracefirst($text),
						  q{WikiDoc},
						  $tracelevel)
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched repeated subrule: [Block]<< (}
					. @$_tok . q{ times)},
					  
					  Parse::RecDescent::_tracefirst($text),
					  q{WikiDoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$item{q{Block(s?)}} = $_tok;
		push @item, $_tok;
		


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{WikiDoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { $return = [ grep { $_->{type} ne 'Empty_Line' } @{ $item[1] } ] };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [Block]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{WikiDoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{WikiDoc},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{WikiDoc},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{WikiDoc},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{WikiDoc},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::RegularText
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"RegularText"};
	
	Parse::RecDescent::_trace(q{Trying rule: [RegularText]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{RegularText},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [m\{ ^ \\S+ \}x]},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{RegularText},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{RegularText});
		%item = (__RULE__ => q{RegularText});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [m\{ ^ \\S+ \}x]}, Parse::RecDescent::_tracefirst($text),
					  q{RegularText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s{\A(?: ^ \S+ )}{}x)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{RegularText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [m\{ ^ \\S+ \}x]<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{RegularText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{RegularText},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{RegularText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{RegularText},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{RegularText},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::BoldText
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"BoldText"};
	
	Parse::RecDescent::_trace(q{Trying rule: [BoldText]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{BoldText},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: []},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{BoldText},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{BoldText});
		%item = (__RULE__ => q{BoldText});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{BoldText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { extract_delimited( $text, '*' ) };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{BoldText},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION2__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: []<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{BoldText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{BoldText},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{BoldText},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{BoldText},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{BoldText},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Header
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Header"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Header]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Header},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^=+/ /[\\t\\ ]+/ /[^\\n]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Header});
		%item = (__RULE__ => q{Header});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^=+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^=+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[\\t\\ ]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[\\t\\ ]+/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[\t\ ]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN3__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        level   => length($item[1]),
                        content => $thisparser->Inline( $item[3] ),
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^=+/ /[\\t\\ ]+/ /[^\\n]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Header},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Header},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Header},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Header},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}

# ARGS ARE: ($parser, $text; $repeating, $_noactions, \@args)
sub Parse::RecDescent::Pod::WikiDoc::Parser::Indented_Line
{
	my $thisparser = $_[0];
	use vars q{$tracelevel};
	local $tracelevel = ($tracelevel||0)+1;
	$ERRORS = 0;
	my $thisrule = $thisparser->{"rules"}{"Indented_Line"};
	
	Parse::RecDescent::_trace(q{Trying rule: [Indented_Line]},
				  Parse::RecDescent::_tracefirst($_[1]),
				  q{Indented_Line},
				  $tracelevel)
					if defined $::RD_TRACE;

	
	my $err_at = @{$thisparser->{errors}};

	my $score;
	my $score_return;
	my $_tok;
	my $return = undef;
	my $_matched=0;
	my $commit=0;
	my @item = ();
	my %item = ();
	my $repeating =  defined($_[2]) && $_[2];
	my $_noactions = defined($_[3]) && $_[3];
 	my @arg =        defined $_[4] ? @{ &{$_[4]} } : ();
	my %arg =        ($#arg & 01) ? @arg : (@arg, undef);
	my $text;
	my $lastsep="";
	my $expectation = new Parse::RecDescent::Expectation($thisrule->expected());
	$expectation->at($_[1]);
	
	my $thisline;
	tie $thisline, q{Parse::RecDescent::LineCounter}, \$text, $thisparser;

	

	while (!$_matched && !$commit)
	{
		
		Parse::RecDescent::_trace(q{Trying production: [/^[\\t\\ ]+/ /[^\\t\\n\\ ]+/ /[^\\n]*/ '\\n']},
					  Parse::RecDescent::_tracefirst($_[1]),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		my $thisprod = $thisrule->{"prods"}[0];
		$text = $_[1];
		my $_savetext;
		@item = (q{Indented_Line});
		%item = (__RULE__ => q{Indented_Line});
		my $repcount = 0;


		Parse::RecDescent::_trace(q{Trying terminal: [/^[\\t\\ ]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:^[\t\ ]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN1__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\t\\n\\ ]+/]}, Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\t\\n\\ ]+/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\t\n\ ]+)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN2__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: [/[^\\n]*/]}, Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{/[^\\n]*/})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   $text =~ s/\A(?:[^\n]*)//)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;

			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $& . q{])},
						  Parse::RecDescent::_tracefirst($text))
					if defined $::RD_TRACE;
		push @item, $item{__PATTERN3__}=$&;
		

		Parse::RecDescent::_trace(q{Trying terminal: ['\\n']},
					  Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$lastsep = "";
		$expectation->is(q{'\\n'})->at($text);
		

		unless ($text =~ s/\A($skip)/$lastsep=$1 and ""/e and   do { $_tok = "\n"; 1 } and
		     substr($text,0,length($_tok)) eq $_tok and
		     do { substr($text,0,length($_tok)) = ""; 1; }
		)
		{
			
			$expectation->failed();
			Parse::RecDescent::_trace(q{<<Didn't match terminal>>},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched terminal<< (return value: [}
						. $_tok . q{])},
						  Parse::RecDescent::_tracefirst($text))
							if defined $::RD_TRACE;
		push @item, $item{__STRING1__}=$_tok;
		

		Parse::RecDescent::_trace(q{Trying action},
					  Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		

		$_tok = ($_noactions) ? 0 : do { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2] . $item[3],
                    }
                };
		unless (defined $_tok)
		{
			Parse::RecDescent::_trace(q{<<Didn't match action>> (return value: [undef])})
					if defined $::RD_TRACE;
			last;
		}
		Parse::RecDescent::_trace(q{>>Matched action<< (return value: [}
					  . $_tok . q{])},
					  Parse::RecDescent::_tracefirst($text))
						if defined $::RD_TRACE;
		push @item, $_tok;
		$item{__ACTION1__}=$_tok;
		


		Parse::RecDescent::_trace(q{>>Matched production: [/^[\\t\\ ]+/ /[^\\t\\n\\ ]+/ /[^\\n]*/ '\\n']<<},
					  Parse::RecDescent::_tracefirst($text),
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$_matched = 1;
		last;
	}


        unless ( $_matched || defined($return) || defined($score) )
	{
		

		$_[1] = $text;	# NOT SURE THIS IS NEEDED
		Parse::RecDescent::_trace(q{<<Didn't match rule>>},
					 Parse::RecDescent::_tracefirst($_[1]),
					 q{Indented_Line},
					 $tracelevel)
					if defined $::RD_TRACE;
		return undef;
	}
	if (!defined($return) && defined($score))
	{
		Parse::RecDescent::_trace(q{>>Accepted scored production<<}, "",
					  q{Indented_Line},
					  $tracelevel)
						if defined $::RD_TRACE;
		$return = $score_return;
	}
	splice @{$thisparser->{errors}}, $err_at;
	$return = $item[$#item] unless defined $return;
	if (defined $::RD_TRACE)
	{
		Parse::RecDescent::_trace(q{>>Matched rule<< (return value: [} .
					  $return . q{])}, "",
					  q{Indented_Line},
					  $tracelevel);
		Parse::RecDescent::_trace(q{(consumed: [} .
					  Parse::RecDescent::_tracemax(substr($_[1],0,-length($text))) . q{])}, 
					  Parse::RecDescent::_tracefirst($text),
					  , q{Indented_Line},
					  $tracelevel)
	}
	$_[1] = $text;
	return $return;
}
}
package Pod::WikiDoc::Parser; sub new { my $self = bless( {
                 '_AUTOTREE' => undef,
                 'localvars' => '',
                 'startcode' => '',
                 '_check' => {
                               'thisoffset' => '',
                               'itempos' => '',
                               'prevoffset' => '',
                               'prevline' => '',
                               'prevcolumn' => '',
                               'thiscolumn' => ''
                             },
                 'namespace' => 'Parse::RecDescent::Pod::WikiDoc::Parser',
                 '_AUTOACTION' => undef,
                 'rules' => {
                              'Chunk' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'WhiteSpace',
                                                               'InlineCode',
                                                               'BoldText',
                                                               'ItalicText',
                                                               'LinkText',
                                                               'EscapedChar',
                                                               'RegularText'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'WhiteSpace',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 134
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 135,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '1',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'InlineCode',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 136
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 137,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 136
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '2',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'BoldText',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 138
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 139,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 138
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '3',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'ItalicText',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 140
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 141,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 140
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '4',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'LinkText',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 142
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 143,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 142
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '5',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'EscapedChar',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 144
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 145,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 144
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '6',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'RegularText',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 146
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 147,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 146
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'Chunk',
                                                  'vars' => '',
                                                  'line' => 133
                                                }, 'Parse::RecDescent::Rule' ),
                              'Paragraph' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'Plain_Line'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 1,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'Plain_Line',
                                                                                                  'expected' => undef,
                                                                                                  'min' => 1,
                                                                                                  'argcode' => undef,
                                                                                                  'max' => 100000000,
                                                                                                  'matchrule' => 0,
                                                                                                  'repspec' => 's',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 119
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 120,
                                                                                                  'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( q{}, @{$item[1]} )
                        ),
                    }
                }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'Paragraph',
                                                      'vars' => '',
                                                      'line' => 118
                                                    }, 'Parse::RecDescent::Rule' ),
                              'ItalicText' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 0,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 2,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 171,
                                                                                                   'code' => '{ extract_delimited( $text, \'~\' ) }'
                                                                                                 }, 'Parse::RecDescent::Action' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION2__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 172,
                                                                                                   'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'ItalicText',
                                                       'vars' => '',
                                                       'line' => 170
                                                     }, 'Parse::RecDescent::Rule' ),
                              'Block' => bless( {
                                                  'impcount' => 0,
                                                  'calls' => [
                                                               'Header',
                                                               'Unordered_List',
                                                               'Ordered_List',
                                                               'Preformat',
                                                               'Paragraph',
                                                               'Empty_Line'
                                                             ],
                                                  'changed' => 0,
                                                  'opcount' => 0,
                                                  'prods' => [
                                                               bless( {
                                                                        'number' => '0',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Header',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 6
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 7,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => undef
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '1',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Unordered_List',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 8
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 9,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 8
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '2',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Ordered_List',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 10
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 11,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 10
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '3',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Preformat',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 12
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 13,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 12
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '4',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Paragraph',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 14
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 15,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 14
                                                                      }, 'Parse::RecDescent::Production' ),
                                                               bless( {
                                                                        'number' => '5',
                                                                        'strcount' => 0,
                                                                        'dircount' => 0,
                                                                        'uncommit' => undef,
                                                                        'error' => undef,
                                                                        'patcount' => 0,
                                                                        'actcount' => 1,
                                                                        'items' => [
                                                                                     bless( {
                                                                                              'subrule' => 'Empty_Line',
                                                                                              'matchrule' => 0,
                                                                                              'implicit' => undef,
                                                                                              'argcode' => undef,
                                                                                              'lookahead' => 0,
                                                                                              'line' => 16
                                                                                            }, 'Parse::RecDescent::Subrule' ),
                                                                                     bless( {
                                                                                              'hashname' => '__ACTION1__',
                                                                                              'lookahead' => 0,
                                                                                              'line' => 17,
                                                                                              'code' => '{ $return = $item[1] }'
                                                                                            }, 'Parse::RecDescent::Action' )
                                                                                   ],
                                                                        'line' => 16
                                                                      }, 'Parse::RecDescent::Production' )
                                                             ],
                                                  'name' => 'Block',
                                                  'vars' => '',
                                                  'line' => 5
                                                }, 'Parse::RecDescent::Rule' ),
                              'Numbered_Line' => bless( {
                                                          'impcount' => 0,
                                                          'calls' => [],
                                                          'changed' => 0,
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'number' => '0',
                                                                                'strcount' => 0,
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'error' => undef,
                                                                                'patcount' => 1,
                                                                                'actcount' => 1,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'pattern' => '^0[\\t\\ ]*\\n',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'description' => '/^0[\\\\t\\\\ ]*\\\\n/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 74,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 75,
                                                                                                      'code' => '{ $return =  q{} }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' ),
                                                                       bless( {
                                                                                'number' => '1',
                                                                                'strcount' => 1,
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'error' => undef,
                                                                                'patcount' => 2,
                                                                                'actcount' => 1,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'pattern' => '^0[\\t\\ ]+',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'description' => '/^0[\\\\t\\\\ ]+/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 76,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'pattern' => '[^\\n]*',
                                                                                                      'hashname' => '__PATTERN2__',
                                                                                                      'description' => '/[^\\\\n]*/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 76,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'pattern' => '\\n',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'description' => '\'\\\\n\'',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 76
                                                                                                    }, 'Parse::RecDescent::InterpLit' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 77,
                                                                                                      'code' => '{ $return = $item[2] }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => 76
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'Numbered_Line',
                                                          'vars' => '',
                                                          'line' => 73
                                                        }, 'Parse::RecDescent::Rule' ),
                              'Bullet_Item' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [
                                                                     'Bullet_Line',
                                                                     'List_Continuation'
                                                                   ],
                                                        'changed' => 0,
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'number' => '0',
                                                                              'strcount' => 0,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 0,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'subrule' => 'Bullet_Line',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 39
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'subrule' => 'List_Continuation',
                                                                                                    'expected' => undef,
                                                                                                    'min' => 0,
                                                                                                    'argcode' => undef,
                                                                                                    'max' => 100000000,
                                                                                                    'matchrule' => 0,
                                                                                                    'repspec' => 's?',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 39
                                                                                                  }, 'Parse::RecDescent::Repetition' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 40,
                                                                                                    'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\\n", $item[1],  @{$item[2]} ) ),
                    }
                }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'Bullet_Item',
                                                        'vars' => '',
                                                        'line' => 38
                                                      }, 'Parse::RecDescent::Rule' ),
                              'LinkTarget' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 0,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 1,
                                                                             'actcount' => 1,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '.+',
                                                                                                   'hashname' => '__PATTERN1__',
                                                                                                   'description' => '/.+/',
                                                                                                   'lookahead' => 0,
                                                                                                   'rdelim' => '/',
                                                                                                   'line' => 242,
                                                                                                   'mod' => '',
                                                                                                   'ldelim' => '/'
                                                                                                 }, 'Parse::RecDescent::Token' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 243,
                                                                                                   'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'LinkTarget',
                                                       'vars' => '',
                                                       'line' => 241
                                                     }, 'Parse::RecDescent::Rule' ),
                              'Plain_Line' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 2,
                                                                             'actcount' => 1,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '^[^*0\\n\\t\\ ]|[*0][^\\t\\ ]',
                                                                                                   'hashname' => '__PATTERN1__',
                                                                                                   'description' => '/^[^*0\\\\n\\\\t\\\\ ]|[*0][^\\\\t\\\\ ]/',
                                                                                                   'lookahead' => 0,
                                                                                                   'rdelim' => '/',
                                                                                                   'line' => 115,
                                                                                                   'mod' => '',
                                                                                                   'ldelim' => '/'
                                                                                                 }, 'Parse::RecDescent::Token' ),
                                                                                          bless( {
                                                                                                   'pattern' => '[^\\n]+',
                                                                                                   'hashname' => '__PATTERN2__',
                                                                                                   'description' => '/[^\\\\n]+/',
                                                                                                   'lookahead' => 0,
                                                                                                   'rdelim' => '/',
                                                                                                   'line' => 115,
                                                                                                   'mod' => '',
                                                                                                   'ldelim' => '/'
                                                                                                 }, 'Parse::RecDescent::Token' ),
                                                                                          bless( {
                                                                                                   'pattern' => '\\n',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'\\\\n\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 115
                                                                                                 }, 'Parse::RecDescent::InterpLit' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 116,
                                                                                                   'code' => '{ $return =  $item[1] . $item[2] . $item[3] }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'Plain_Line',
                                                       'vars' => '',
                                                       'line' => 114
                                                     }, 'Parse::RecDescent::Rule' ),
                              'WhiteSpace' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 0,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 1,
                                                                             'actcount' => 1,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => ' ^ \\s+ ',
                                                                                                   'hashname' => '__PATTERN1__',
                                                                                                   'description' => 'm\\{ ^ \\\\s+ \\}x',
                                                                                                   'lookahead' => 0,
                                                                                                   'rdelim' => '}',
                                                                                                   'line' => 208,
                                                                                                   'mod' => 'x',
                                                                                                   'ldelim' => '{'
                                                                                                 }, 'Parse::RecDescent::Token' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 209,
                                                                                                   'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'WhiteSpace',
                                                       'vars' => '',
                                                       'line' => 207
                                                     }, 'Parse::RecDescent::Rule' ),
                              'Indent_Continuation' => bless( {
                                                                'impcount' => 0,
                                                                'calls' => [
                                                                             'Empty_Line',
                                                                             'Indented_Line'
                                                                           ],
                                                                'changed' => 0,
                                                                'opcount' => 0,
                                                                'prods' => [
                                                                             bless( {
                                                                                      'number' => '0',
                                                                                      'strcount' => 0,
                                                                                      'dircount' => 0,
                                                                                      'uncommit' => undef,
                                                                                      'error' => undef,
                                                                                      'patcount' => 0,
                                                                                      'actcount' => 1,
                                                                                      'items' => [
                                                                                                   bless( {
                                                                                                            'subrule' => 'Empty_Line',
                                                                                                            'expected' => undef,
                                                                                                            'min' => 1,
                                                                                                            'argcode' => undef,
                                                                                                            'max' => 100000000,
                                                                                                            'matchrule' => 0,
                                                                                                            'repspec' => 's',
                                                                                                            'lookahead' => 0,
                                                                                                            'line' => 102
                                                                                                          }, 'Parse::RecDescent::Repetition' ),
                                                                                                   bless( {
                                                                                                            'subrule' => 'Indented_Line',
                                                                                                            'expected' => undef,
                                                                                                            'min' => 1,
                                                                                                            'argcode' => undef,
                                                                                                            'max' => 100000000,
                                                                                                            'matchrule' => 0,
                                                                                                            'repspec' => 's',
                                                                                                            'lookahead' => 0,
                                                                                                            'line' => 102
                                                                                                          }, 'Parse::RecDescent::Repetition' ),
                                                                                                   bless( {
                                                                                                            'hashname' => '__ACTION1__',
                                                                                                            'lookahead' => 0,
                                                                                                            'line' => 103,
                                                                                                            'code' => '{ $return = [ @{$item[1]}, @{$item[2]} ] }'
                                                                                                          }, 'Parse::RecDescent::Action' )
                                                                                                 ],
                                                                                      'line' => undef
                                                                                    }, 'Parse::RecDescent::Production' )
                                                                           ],
                                                                'name' => 'Indent_Continuation',
                                                                'vars' => '',
                                                                'line' => 101
                                                              }, 'Parse::RecDescent::Rule' ),
                              'Numbered_Item' => bless( {
                                                          'impcount' => 0,
                                                          'calls' => [
                                                                       'Numbered_Line',
                                                                       'List_Continuation'
                                                                     ],
                                                          'changed' => 0,
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'number' => '0',
                                                                                'strcount' => 0,
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'error' => undef,
                                                                                'patcount' => 0,
                                                                                'actcount' => 1,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'subrule' => 'Numbered_Line',
                                                                                                      'matchrule' => 0,
                                                                                                      'implicit' => undef,
                                                                                                      'argcode' => undef,
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 63
                                                                                                    }, 'Parse::RecDescent::Subrule' ),
                                                                                             bless( {
                                                                                                      'subrule' => 'List_Continuation',
                                                                                                      'expected' => undef,
                                                                                                      'min' => 0,
                                                                                                      'argcode' => undef,
                                                                                                      'max' => 100000000,
                                                                                                      'matchrule' => 0,
                                                                                                      'repspec' => 's?',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 63
                                                                                                    }, 'Parse::RecDescent::Repetition' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 64,
                                                                                                      'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( "\\n", $item[1],  @{$item[2]} ) 
                        ),
                    }
                }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'Numbered_Item',
                                                          'vars' => '',
                                                          'line' => 62
                                                        }, 'Parse::RecDescent::Rule' ),
                              'Preformat' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [
                                                                   'Indented_Line',
                                                                   'Indent_Continuation',
                                                                   'Empty_Line'
                                                                 ],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 0,
                                                                            'actcount' => 1,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'subrule' => 'Indented_Line',
                                                                                                  'expected' => undef,
                                                                                                  'min' => 1,
                                                                                                  'argcode' => undef,
                                                                                                  'max' => 100000000,
                                                                                                  'matchrule' => 0,
                                                                                                  'repspec' => 's',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 84
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'subrule' => 'Indent_Continuation',
                                                                                                  'expected' => undef,
                                                                                                  'min' => 0,
                                                                                                  'argcode' => undef,
                                                                                                  'max' => 100000000,
                                                                                                  'matchrule' => 0,
                                                                                                  'repspec' => 's?',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 84
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'subrule' => 'Empty_Line',
                                                                                                  'expected' => undef,
                                                                                                  'min' => 0,
                                                                                                  'argcode' => undef,
                                                                                                  'max' => 1,
                                                                                                  'matchrule' => 0,
                                                                                                  'repspec' => '?',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 84
                                                                                                }, 'Parse::RecDescent::Repetition' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 85,
                                                                                                  'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => [ @{$item[1]}, map { @{$_} } @{$item[2]} ],
                    }
                }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'Preformat',
                                                      'vars' => '',
                                                      'line' => 83
                                                    }, 'Parse::RecDescent::Rule' ),
                              'Empty_Line' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 1,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 1,
                                                                             'actcount' => 1,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'pattern' => '^[\\t\\ ]*',
                                                                                                   'hashname' => '__PATTERN1__',
                                                                                                   'description' => '/^[\\\\t\\\\ ]*/',
                                                                                                   'lookahead' => 0,
                                                                                                   'rdelim' => '/',
                                                                                                   'line' => 106,
                                                                                                   'mod' => '',
                                                                                                   'ldelim' => '/'
                                                                                                 }, 'Parse::RecDescent::Token' ),
                                                                                          bless( {
                                                                                                   'pattern' => '\\n',
                                                                                                   'hashname' => '__STRING1__',
                                                                                                   'description' => '\'\\\\n\'',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 106
                                                                                                 }, 'Parse::RecDescent::InterpLit' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 107,
                                                                                                   'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'Empty_Line',
                                                       'vars' => '',
                                                       'line' => 105
                                                     }, 'Parse::RecDescent::Rule' ),
                              'Bullet_Line' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [],
                                                        'changed' => 0,
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'number' => '0',
                                                                              'strcount' => 0,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 1,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'pattern' => '^\\*[\\t\\ ]*\\n',
                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                    'description' => '/^\\\\*[\\\\t\\\\ ]*\\\\n/',
                                                                                                    'lookahead' => 0,
                                                                                                    'rdelim' => '/',
                                                                                                    'line' => 48,
                                                                                                    'mod' => '',
                                                                                                    'ldelim' => '/'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 49,
                                                                                                    'code' => '{ $return = q{} }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' ),
                                                                     bless( {
                                                                              'number' => '1',
                                                                              'strcount' => 1,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 2,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'pattern' => '^\\*[\\t\\ ]+',
                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                    'description' => '/^\\\\*[\\\\t\\\\ ]+/',
                                                                                                    'lookahead' => 0,
                                                                                                    'rdelim' => '/',
                                                                                                    'line' => 50,
                                                                                                    'mod' => '',
                                                                                                    'ldelim' => '/'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'pattern' => '[^\\n]*',
                                                                                                    'hashname' => '__PATTERN2__',
                                                                                                    'description' => '/[^\\\\n]*/',
                                                                                                    'lookahead' => 0,
                                                                                                    'rdelim' => '/',
                                                                                                    'line' => 50,
                                                                                                    'mod' => '',
                                                                                                    'ldelim' => '/'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'pattern' => '\\n',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'description' => '\'\\\\n\'',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 50
                                                                                                  }, 'Parse::RecDescent::InterpLit' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 51,
                                                                                                    'code' => '{ $return = $item[2] }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => 50
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'Bullet_Line',
                                                        'vars' => '',
                                                        'line' => 47
                                                      }, 'Parse::RecDescent::Rule' ),
                              'InlineCode' => bless( {
                                                       'impcount' => 0,
                                                       'calls' => [],
                                                       'changed' => 0,
                                                       'opcount' => 0,
                                                       'prods' => [
                                                                    bless( {
                                                                             'number' => '0',
                                                                             'strcount' => 0,
                                                                             'dircount' => 0,
                                                                             'uncommit' => undef,
                                                                             'error' => undef,
                                                                             'patcount' => 0,
                                                                             'actcount' => 2,
                                                                             'items' => [
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION1__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 150,
                                                                                                   'code' => '{ extract_bracketed( $text, \'{\' ) }'
                                                                                                 }, 'Parse::RecDescent::Action' ),
                                                                                          bless( {
                                                                                                   'hashname' => '__ACTION2__',
                                                                                                   'lookahead' => 0,
                                                                                                   'line' => 151,
                                                                                                   'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }'
                                                                                                 }, 'Parse::RecDescent::Action' )
                                                                                        ],
                                                                             'line' => undef
                                                                           }, 'Parse::RecDescent::Production' )
                                                                  ],
                                                       'name' => 'InlineCode',
                                                       'vars' => '',
                                                       'line' => 149
                                                     }, 'Parse::RecDescent::Rule' ),
                              'LinkText' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 2,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 182,
                                                                                                 'code' => '{ extract_bracketed( $text, \'[\' ) }'
                                                                                               }, 'Parse::RecDescent::Action' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION2__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 183,
                                                                                                 'code' => '{ 
                    $return = $thisparser->LinkContent( 
                        substr( substr( $item[1], 1), 0, -1 )
                    ),
                }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'LinkText',
                                                     'vars' => '',
                                                     'line' => 181
                                                   }, 'Parse::RecDescent::Rule' ),
                              'Ordered_List' => bless( {
                                                         'impcount' => 0,
                                                         'calls' => [
                                                                      'Numbered_Item',
                                                                      'Empty_Line'
                                                                    ],
                                                         'changed' => 0,
                                                         'opcount' => 0,
                                                         'prods' => [
                                                                      bless( {
                                                                               'number' => '0',
                                                                               'strcount' => 0,
                                                                               'dircount' => 0,
                                                                               'uncommit' => undef,
                                                                               'error' => undef,
                                                                               'patcount' => 0,
                                                                               'actcount' => 1,
                                                                               'items' => [
                                                                                            bless( {
                                                                                                     'subrule' => 'Numbered_Item',
                                                                                                     'expected' => undef,
                                                                                                     'min' => 1,
                                                                                                     'argcode' => undef,
                                                                                                     'max' => 100000000,
                                                                                                     'matchrule' => 0,
                                                                                                     'repspec' => 's',
                                                                                                     'lookahead' => 0,
                                                                                                     'line' => 54
                                                                                                   }, 'Parse::RecDescent::Repetition' ),
                                                                                            bless( {
                                                                                                     'subrule' => 'Empty_Line',
                                                                                                     'expected' => undef,
                                                                                                     'min' => 0,
                                                                                                     'argcode' => undef,
                                                                                                     'max' => 1,
                                                                                                     'matchrule' => 0,
                                                                                                     'repspec' => '?',
                                                                                                     'lookahead' => 0,
                                                                                                     'line' => 54
                                                                                                   }, 'Parse::RecDescent::Repetition' ),
                                                                                            bless( {
                                                                                                     'hashname' => '__ACTION1__',
                                                                                                     'lookahead' => 0,
                                                                                                     'line' => 55,
                                                                                                     'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                   }, 'Parse::RecDescent::Action' )
                                                                                          ],
                                                                               'line' => undef
                                                                             }, 'Parse::RecDescent::Production' )
                                                                    ],
                                                         'name' => 'Ordered_List',
                                                         'vars' => '',
                                                         'line' => 53
                                                       }, 'Parse::RecDescent::Rule' ),
                              'LinkLabel' => bless( {
                                                      'impcount' => 0,
                                                      'calls' => [],
                                                      'changed' => 0,
                                                      'opcount' => 0,
                                                      'prods' => [
                                                                   bless( {
                                                                            'number' => '0',
                                                                            'strcount' => 0,
                                                                            'dircount' => 0,
                                                                            'uncommit' => undef,
                                                                            'error' => undef,
                                                                            'patcount' => 1,
                                                                            'actcount' => 1,
                                                                            'items' => [
                                                                                         bless( {
                                                                                                  'pattern' => '^[^|]*',
                                                                                                  'hashname' => '__PATTERN1__',
                                                                                                  'description' => '/^[^|]*/',
                                                                                                  'lookahead' => 0,
                                                                                                  'rdelim' => '/',
                                                                                                  'line' => 233,
                                                                                                  'mod' => '',
                                                                                                  'ldelim' => '/'
                                                                                                }, 'Parse::RecDescent::Token' ),
                                                                                         bless( {
                                                                                                  'hashname' => '__ACTION1__',
                                                                                                  'lookahead' => 0,
                                                                                                  'line' => 234,
                                                                                                  'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( $item[1] ),
                    }
                }'
                                                                                                }, 'Parse::RecDescent::Action' )
                                                                                       ],
                                                                            'line' => undef
                                                                          }, 'Parse::RecDescent::Production' )
                                                                 ],
                                                      'name' => 'LinkLabel',
                                                      'vars' => '',
                                                      'line' => 232
                                                    }, 'Parse::RecDescent::Rule' ),
                              'Inline' => bless( {
                                                   'impcount' => 0,
                                                   'calls' => [
                                                                'Chunk'
                                                              ],
                                                   'changed' => 0,
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'number' => '0',
                                                                         'strcount' => 0,
                                                                         'dircount' => 0,
                                                                         'uncommit' => undef,
                                                                         'error' => undef,
                                                                         'patcount' => 0,
                                                                         'actcount' => 1,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'subrule' => 'Chunk',
                                                                                               'expected' => undef,
                                                                                               'min' => 0,
                                                                                               'argcode' => undef,
                                                                                               'max' => 100000000,
                                                                                               'matchrule' => 0,
                                                                                               'repspec' => 's?',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 130
                                                                                             }, 'Parse::RecDescent::Repetition' ),
                                                                                      bless( {
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 131,
                                                                                               'code' => '{ $return = $item[1] }'
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'name' => 'Inline',
                                                   'vars' => '',
                                                   'line' => 129
                                                 }, 'Parse::RecDescent::Rule' ),
                              'List_Continuation' => bless( {
                                                              'impcount' => 0,
                                                              'calls' => [],
                                                              'changed' => 0,
                                                              'opcount' => 0,
                                                              'prods' => [
                                                                           bless( {
                                                                                    'number' => '0',
                                                                                    'strcount' => 1,
                                                                                    'dircount' => 0,
                                                                                    'uncommit' => undef,
                                                                                    'error' => undef,
                                                                                    'patcount' => 2,
                                                                                    'actcount' => 1,
                                                                                    'items' => [
                                                                                                 bless( {
                                                                                                          'pattern' => '^[^*0\\s]',
                                                                                                          'hashname' => '__PATTERN1__',
                                                                                                          'description' => '/^[^*0\\\\s]/',
                                                                                                          'lookahead' => 0,
                                                                                                          'rdelim' => '/',
                                                                                                          'line' => 80,
                                                                                                          'mod' => '',
                                                                                                          'ldelim' => '/'
                                                                                                        }, 'Parse::RecDescent::Token' ),
                                                                                                 bless( {
                                                                                                          'pattern' => '[^\\n]*',
                                                                                                          'hashname' => '__PATTERN2__',
                                                                                                          'description' => '/[^\\\\n]*/',
                                                                                                          'lookahead' => 0,
                                                                                                          'rdelim' => '/',
                                                                                                          'line' => 80,
                                                                                                          'mod' => '',
                                                                                                          'ldelim' => '/'
                                                                                                        }, 'Parse::RecDescent::Token' ),
                                                                                                 bless( {
                                                                                                          'pattern' => '\\n',
                                                                                                          'hashname' => '__STRING1__',
                                                                                                          'description' => '\'\\\\n\'',
                                                                                                          'lookahead' => 0,
                                                                                                          'line' => 80
                                                                                                        }, 'Parse::RecDescent::InterpLit' ),
                                                                                                 bless( {
                                                                                                          'hashname' => '__ACTION1__',
                                                                                                          'lookahead' => 0,
                                                                                                          'line' => 81,
                                                                                                          'code' => '{ $return = $item[1] . $item[2] }'
                                                                                                        }, 'Parse::RecDescent::Action' )
                                                                                               ],
                                                                                    'line' => undef
                                                                                  }, 'Parse::RecDescent::Production' )
                                                                         ],
                                                              'name' => 'List_Continuation',
                                                              'vars' => '',
                                                              'line' => 79
                                                            }, 'Parse::RecDescent::Rule' ),
                              'LinkContent' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [
                                                                     'LinkLabel',
                                                                     'LinkTarget'
                                                                   ],
                                                        'changed' => 0,
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'number' => '0',
                                                                              'strcount' => 1,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 0,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'subrule' => 'LinkLabel',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 217
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'pattern' => '\\|',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'description' => '\'\\\\|\'',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 217
                                                                                                  }, 'Parse::RecDescent::InterpLit' ),
                                                                                           bless( {
                                                                                                    'subrule' => 'LinkTarget',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 217
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 218,
                                                                                                    'code' => '{   
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1], $item[3] ],
                    }
                }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' ),
                                                                     bless( {
                                                                              'number' => '1',
                                                                              'strcount' => 0,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 0,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'subrule' => 'LinkTarget',
                                                                                                    'matchrule' => 0,
                                                                                                    'implicit' => undef,
                                                                                                    'argcode' => undef,
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 224
                                                                                                  }, 'Parse::RecDescent::Subrule' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 225,
                                                                                                    'code' => '{
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1] ],
                    }
                }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => 224
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'LinkContent',
                                                        'vars' => '',
                                                        'line' => 216
                                                      }, 'Parse::RecDescent::Rule' ),
                              'EscapedChar' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [],
                                                        'changed' => 0,
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'number' => '0',
                                                                              'strcount' => 1,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 0,
                                                                              'actcount' => 2,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'pattern' => 'E',
                                                                                                    'hashname' => '__STRING1__',
                                                                                                    'description' => '\'E\'',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 190
                                                                                                  }, 'Parse::RecDescent::InterpLit' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 190,
                                                                                                    'code' => '{ extract_bracketed( $text, \'<\' ) }'
                                                                                                  }, 'Parse::RecDescent::Action' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION2__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 191,
                                                                                                    'code' => '{
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2]
                    }
                }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'EscapedChar',
                                                        'vars' => '',
                                                        'line' => 189
                                                      }, 'Parse::RecDescent::Rule' ),
                              'Unordered_List' => bless( {
                                                           'impcount' => 0,
                                                           'calls' => [
                                                                        'Bullet_Item',
                                                                        'Empty_Line'
                                                                      ],
                                                           'changed' => 0,
                                                           'opcount' => 0,
                                                           'prods' => [
                                                                        bless( {
                                                                                 'number' => '0',
                                                                                 'strcount' => 0,
                                                                                 'dircount' => 0,
                                                                                 'uncommit' => undef,
                                                                                 'error' => undef,
                                                                                 'patcount' => 0,
                                                                                 'actcount' => 1,
                                                                                 'items' => [
                                                                                              bless( {
                                                                                                       'subrule' => 'Bullet_Item',
                                                                                                       'expected' => undef,
                                                                                                       'min' => 1,
                                                                                                       'argcode' => undef,
                                                                                                       'max' => 100000000,
                                                                                                       'matchrule' => 0,
                                                                                                       'repspec' => 's',
                                                                                                       'lookahead' => 0,
                                                                                                       'line' => 30
                                                                                                     }, 'Parse::RecDescent::Repetition' ),
                                                                                              bless( {
                                                                                                       'subrule' => 'Empty_Line',
                                                                                                       'expected' => undef,
                                                                                                       'min' => 0,
                                                                                                       'argcode' => undef,
                                                                                                       'max' => 1,
                                                                                                       'matchrule' => 0,
                                                                                                       'repspec' => '?',
                                                                                                       'lookahead' => 0,
                                                                                                       'line' => 30
                                                                                                     }, 'Parse::RecDescent::Repetition' ),
                                                                                              bless( {
                                                                                                       'hashname' => '__ACTION1__',
                                                                                                       'lookahead' => 0,
                                                                                                       'line' => 31,
                                                                                                       'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                     }, 'Parse::RecDescent::Action' )
                                                                                            ],
                                                                                 'line' => undef
                                                                               }, 'Parse::RecDescent::Production' )
                                                                      ],
                                                           'name' => 'Unordered_List',
                                                           'vars' => '',
                                                           'line' => 29
                                                         }, 'Parse::RecDescent::Rule' ),
                              'WikiDoc' => bless( {
                                                    'impcount' => 0,
                                                    'calls' => [
                                                                 'Block'
                                                               ],
                                                    'changed' => 0,
                                                    'opcount' => 0,
                                                    'prods' => [
                                                                 bless( {
                                                                          'number' => '0',
                                                                          'strcount' => 0,
                                                                          'dircount' => 0,
                                                                          'uncommit' => undef,
                                                                          'error' => undef,
                                                                          'patcount' => 0,
                                                                          'actcount' => 1,
                                                                          'items' => [
                                                                                       bless( {
                                                                                                'subrule' => 'Block',
                                                                                                'expected' => undef,
                                                                                                'min' => 0,
                                                                                                'argcode' => undef,
                                                                                                'max' => 100000000,
                                                                                                'matchrule' => 0,
                                                                                                'repspec' => 's?',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 2
                                                                                              }, 'Parse::RecDescent::Repetition' ),
                                                                                       bless( {
                                                                                                'hashname' => '__ACTION1__',
                                                                                                'lookahead' => 0,
                                                                                                'line' => 3,
                                                                                                'code' => '{ $return = [ grep { $_->{type} ne \'Empty_Line\' } @{ $item[1] } ] }'
                                                                                              }, 'Parse::RecDescent::Action' )
                                                                                     ],
                                                                          'line' => undef
                                                                        }, 'Parse::RecDescent::Production' )
                                                               ],
                                                    'name' => 'WikiDoc',
                                                    'vars' => '',
                                                    'line' => 1
                                                  }, 'Parse::RecDescent::Rule' ),
                              'RegularText' => bless( {
                                                        'impcount' => 0,
                                                        'calls' => [],
                                                        'changed' => 0,
                                                        'opcount' => 0,
                                                        'prods' => [
                                                                     bless( {
                                                                              'number' => '0',
                                                                              'strcount' => 0,
                                                                              'dircount' => 0,
                                                                              'uncommit' => undef,
                                                                              'error' => undef,
                                                                              'patcount' => 1,
                                                                              'actcount' => 1,
                                                                              'items' => [
                                                                                           bless( {
                                                                                                    'pattern' => ' ^ \\S+ ',
                                                                                                    'hashname' => '__PATTERN1__',
                                                                                                    'description' => 'm\\{ ^ \\\\S+ \\}x',
                                                                                                    'lookahead' => 0,
                                                                                                    'rdelim' => '}',
                                                                                                    'line' => 199,
                                                                                                    'mod' => 'x',
                                                                                                    'ldelim' => '{'
                                                                                                  }, 'Parse::RecDescent::Token' ),
                                                                                           bless( {
                                                                                                    'hashname' => '__ACTION1__',
                                                                                                    'lookahead' => 0,
                                                                                                    'line' => 200,
                                                                                                    'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }'
                                                                                                  }, 'Parse::RecDescent::Action' )
                                                                                         ],
                                                                              'line' => undef
                                                                            }, 'Parse::RecDescent::Production' )
                                                                   ],
                                                        'name' => 'RegularText',
                                                        'vars' => '',
                                                        'line' => 198
                                                      }, 'Parse::RecDescent::Rule' ),
                              'BoldText' => bless( {
                                                     'impcount' => 0,
                                                     'calls' => [],
                                                     'changed' => 0,
                                                     'opcount' => 0,
                                                     'prods' => [
                                                                  bless( {
                                                                           'number' => '0',
                                                                           'strcount' => 0,
                                                                           'dircount' => 0,
                                                                           'uncommit' => undef,
                                                                           'error' => undef,
                                                                           'patcount' => 0,
                                                                           'actcount' => 2,
                                                                           'items' => [
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION1__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 160,
                                                                                                 'code' => '{ extract_delimited( $text, \'*\' ) }'
                                                                                               }, 'Parse::RecDescent::Action' ),
                                                                                        bless( {
                                                                                                 'hashname' => '__ACTION2__',
                                                                                                 'lookahead' => 0,
                                                                                                 'line' => 161,
                                                                                                 'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }'
                                                                                               }, 'Parse::RecDescent::Action' )
                                                                                      ],
                                                                           'line' => undef
                                                                         }, 'Parse::RecDescent::Production' )
                                                                ],
                                                     'name' => 'BoldText',
                                                     'vars' => '',
                                                     'line' => 159
                                                   }, 'Parse::RecDescent::Rule' ),
                              'Header' => bless( {
                                                   'impcount' => 0,
                                                   'calls' => [],
                                                   'changed' => 0,
                                                   'opcount' => 0,
                                                   'prods' => [
                                                                bless( {
                                                                         'number' => '0',
                                                                         'strcount' => 1,
                                                                         'dircount' => 0,
                                                                         'uncommit' => undef,
                                                                         'error' => undef,
                                                                         'patcount' => 3,
                                                                         'actcount' => 1,
                                                                         'items' => [
                                                                                      bless( {
                                                                                               'pattern' => '^=+',
                                                                                               'hashname' => '__PATTERN1__',
                                                                                               'description' => '/^=+/',
                                                                                               'lookahead' => 0,
                                                                                               'rdelim' => '/',
                                                                                               'line' => 20,
                                                                                               'mod' => '',
                                                                                               'ldelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'pattern' => '[\\t\\ ]+',
                                                                                               'hashname' => '__PATTERN2__',
                                                                                               'description' => '/[\\\\t\\\\ ]+/',
                                                                                               'lookahead' => 0,
                                                                                               'rdelim' => '/',
                                                                                               'line' => 20,
                                                                                               'mod' => '',
                                                                                               'ldelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'pattern' => '[^\\n]*',
                                                                                               'hashname' => '__PATTERN3__',
                                                                                               'description' => '/[^\\\\n]*/',
                                                                                               'lookahead' => 0,
                                                                                               'rdelim' => '/',
                                                                                               'line' => 20,
                                                                                               'mod' => '',
                                                                                               'ldelim' => '/'
                                                                                             }, 'Parse::RecDescent::Token' ),
                                                                                      bless( {
                                                                                               'pattern' => '\\n',
                                                                                               'hashname' => '__STRING1__',
                                                                                               'description' => '\'\\\\n\'',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 20
                                                                                             }, 'Parse::RecDescent::InterpLit' ),
                                                                                      bless( {
                                                                                               'hashname' => '__ACTION1__',
                                                                                               'lookahead' => 0,
                                                                                               'line' => 21,
                                                                                               'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        level   => length($item[1]),
                        content => $thisparser->Inline( $item[3] ),
                    }
                }'
                                                                                             }, 'Parse::RecDescent::Action' )
                                                                                    ],
                                                                         'line' => undef
                                                                       }, 'Parse::RecDescent::Production' )
                                                              ],
                                                   'name' => 'Header',
                                                   'vars' => '',
                                                   'line' => 19
                                                 }, 'Parse::RecDescent::Rule' ),
                              'Indented_Line' => bless( {
                                                          'impcount' => 0,
                                                          'calls' => [],
                                                          'changed' => 0,
                                                          'opcount' => 0,
                                                          'prods' => [
                                                                       bless( {
                                                                                'number' => '0',
                                                                                'strcount' => 1,
                                                                                'dircount' => 0,
                                                                                'uncommit' => undef,
                                                                                'error' => undef,
                                                                                'patcount' => 3,
                                                                                'actcount' => 1,
                                                                                'items' => [
                                                                                             bless( {
                                                                                                      'pattern' => '^[\\t\\ ]+',
                                                                                                      'hashname' => '__PATTERN1__',
                                                                                                      'description' => '/^[\\\\t\\\\ ]+/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 93,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'pattern' => '[^\\t\\n\\ ]+',
                                                                                                      'hashname' => '__PATTERN2__',
                                                                                                      'description' => '/[^\\\\t\\\\n\\\\ ]+/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 93,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'pattern' => '[^\\n]*',
                                                                                                      'hashname' => '__PATTERN3__',
                                                                                                      'description' => '/[^\\\\n]*/',
                                                                                                      'lookahead' => 0,
                                                                                                      'rdelim' => '/',
                                                                                                      'line' => 93,
                                                                                                      'mod' => '',
                                                                                                      'ldelim' => '/'
                                                                                                    }, 'Parse::RecDescent::Token' ),
                                                                                             bless( {
                                                                                                      'pattern' => '\\n',
                                                                                                      'hashname' => '__STRING1__',
                                                                                                      'description' => '\'\\\\n\'',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 93
                                                                                                    }, 'Parse::RecDescent::InterpLit' ),
                                                                                             bless( {
                                                                                                      'hashname' => '__ACTION1__',
                                                                                                      'lookahead' => 0,
                                                                                                      'line' => 94,
                                                                                                      'code' => '{ 
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2] . $item[3],
                    }
                }'
                                                                                                    }, 'Parse::RecDescent::Action' )
                                                                                           ],
                                                                                'line' => undef
                                                                              }, 'Parse::RecDescent::Production' )
                                                                     ],
                                                          'name' => 'Indented_Line',
                                                          'vars' => '',
                                                          'line' => 92
                                                        }, 'Parse::RecDescent::Rule' )
                            }
               }, 'Parse::RecDescent' );
}

use vars qw( $VERSION );
$VERSION = "0.13";



__END__


=begin wikidoc

= NAME

Pod::WikiDoc::Parser -- precompiled recursive descent parser for Pod::WikiDoc

= SYNOPSIS

    use Pod::WikiDoc::Parser;
 
    my $parser = Pod::WikiDoc::Parser->new();

    my $tree = $parser->WikiDoc( $text );

= DESCRIPTION

Pod::WikiDoc::Parser is a precompiled [Parse::RecDescent] parser for use with
[Pod::WikiDoc].  It is generated dynamically on installation of Pod::WikiDoc
from a grammar included with the distribution.  

A copy of the Parse::RecDescent grammar used is appended to the
Pod::WikiDoc::Parser source and this Pod file for reference or reuse by
others.

= USAGE

This module is a support module for Pod::WikiDoc and is not intended for
general use.  Given a string containing WikiDoc markup text, the parser
produces a data structure representing the parsed content.  The data structure
returned is an array of references to hashes.  Keys in the hash are:

* type: the parser rule that generated the hash
* content: either a reference to another AoH or a string of text
* level: (only for "Header" type hashes) the level of the header

See [Pod::WikiDoc] for details of the markup.

= SEE ALSO

There are numerous Perl wikitext parsers, formatters or translators, some of
which were instructive in designing this parser.  All the ones I could find are
included below for reference for those interested in the topic:

* CGI::Wiki::Formatter
* Convert::Wiki
* HTML::WikiConverter
* Kwiki::Formatter
* Pod::TikiWiki
* PurpleWiki::Parser::WikiText
* Template::Plugin::KwikiFormat
* Text::WikiFormat

= AUTHOR

David A Golden (DAGOLDEN)

dagolden@cpan.org

[http://dagolden.com/]

= COPYRIGHT

Copyright (c) 2005 by David A Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=end wikidoc

=cut



=begin grammar

    WikiDoc:        
            Block(s?)
                { $return = [ grep { $_->{type} ne 'Empty_Line' } @{ $item[1] } ] }

    Block:          
            Header 
                { $return = $item[1] }
        |   Unordered_List 
                { $return = $item[1] }
        |   Ordered_List 
                { $return = $item[1] }
        |   Preformat
                { $return = $item[1] }
        |   Paragraph
                { $return = $item[1] }
        |   Empty_Line
                { $return = $item[1] }

    Header:         
            /^=+/ /[\t\ ]+/ /[^\n]*/ "\n" 
                { 
                    $return = { 
                        type    => $item[0],
                        level   => length($item[1]),
                        content => $thisparser->Inline( $item[3] ),
                    }
                }

    Unordered_List: 
            Bullet_Item(s) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Bullet_Item:    
            Bullet_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( join( "\n", $item[1],  @{$item[2]} ) ),
                    }
                }
    
    Bullet_Line:    
            /^\*[\t\ ]*\n/
                { $return = q{} }
        |   /^\*[\t\ ]+/ /[^\n]*/ "\n"
                { $return = $item[2] }

    Ordered_List:   
            Numbered_Item(s) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Numbered_Item:  
            Numbered_Line List_Continuation(s?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( "\n", $item[1],  @{$item[2]} ) 
                        ),
                    }
                }
    
    Numbered_Line:  
            /^0[\t\ ]*\n/ 
                { $return =  q{} }
        |   /^0[\t\ ]+/ /[^\n]*/ "\n"
                { $return = $item[2] }

    List_Continuation: 
            /^[^*0\s]/ /[^\n]*/ "\n"
                { $return = $item[1] . $item[2] }
    
    Preformat:      
            Indented_Line(s) Indent_Continuation(s?) Empty_Line(?)
                { 
                    $return = { 
                        type    => $item[0],
                        content => [ @{$item[1]}, map { @{$_} } @{$item[2]} ],
                    }
                }
    
    Indented_Line:  
            /^[\t\ ]+/ /[^\t\n\ ]+/ /[^\n]*/ "\n"
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2] . $item[3],
                    }
                }

    Indent_Continuation:
            Empty_Line(s) Indented_Line(s)
                { $return = [ @{$item[1]}, @{$item[2]} ] }
                    
    Empty_Line:     
            /^[\t\ ]*/ "\n"
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    
    Plain_Line:     
            /^[^*0\n\t\ ]|[*0][^\t\ ]/ /[^\n]+/ "\n"
                { $return =  $item[1] . $item[2] . $item[3] }

    Paragraph:      
            Plain_Line(s)
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( 
                            join( q{}, @{$item[1]} )
                        ),
                    }
                }

    Inline: 
            Chunk(s?)
                { $return = $item[1] }

    Chunk:
            WhiteSpace
                { $return = $item[1] }
        |   InlineCode
                { $return = $item[1] }
        |   BoldText
                { $return = $item[1] }
        |   ItalicText
                { $return = $item[1] }
        |   LinkText
                { $return = $item[1] }
        |   EscapedChar
                { $return = $item[1] }
        |   RegularText
                { $return = $item[1] }

    InlineCode:   
            { extract_bracketed( $text, '{' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => substr( substr( $item[1], 1), 0, -1 ),
                    }
                }


    BoldText:   
            { extract_delimited( $text, '*' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }

    ItalicText: 
            { extract_delimited( $text, '~' ) }
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline(
                            substr( substr( $item[1], 1), 0, -1 )
                        ),
                    }
                }

    LinkText:   
            { extract_bracketed( $text, '[' ) }
                { 
                    $return = $thisparser->LinkContent( 
                        substr( substr( $item[1], 1), 0, -1 )
                    ),
                }

    EscapedChar:
            "E" { extract_bracketed( $text, '<' ) }
                {
                    $return = { 
                        type    => $item[0],
                        content => $item[1] . $item[2]
                    }
                }

    RegularText:  
            m{ ^ \S+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    WhiteSpace:  
            m{ ^ \s+ }x
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }

    LinkContent:
            LinkLabel "\|" LinkTarget
                {   
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1], $item[3] ],
                    }
                }
        |   LinkTarget
                {
                    $return = { 
                        type    => $item[0],
                        content => [ $item[1] ],
                    }
                }

    LinkLabel:
            /^[^|]*/
                { 
                    $return = { 
                        type    => $item[0],
                        content => $thisparser->Inline( $item[1] ),
                    }
                }

    LinkTarget:
            /.+/
                { 
                    $return = { 
                        type    => $item[0],
                        content => $item[1],
                    }
                }
    


=end grammar

