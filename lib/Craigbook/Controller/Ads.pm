package Craigbook::Controller::Ads;
use Moose;
use namespace::autoclean;
use Craigbook::Schema;
use Data::Dumper;

BEGIN {extends 'Catalyst::Controller'; }




=head1 NAME

Craigbook::Controller::Ads - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut



=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Craigbook::Controller::Ads in Ads.');
}

=head2 list
    
Fetch all book objects and pass to books/list.tt2 in stash to be displayed
    
=cut
    
sub list :Local {
        # Retrieve the usual Perl OO '$self' for this object. $c is the Catalyst
        # 'Context' that's used to 'glue together' the various components
        # that make up the application
        my ($self, $c) = @_;
    	 
        # Retrieve all of the book records as book model objects and store in the
        # stash where they can be accessed by the TT template
       
	my @fields;
	
	my $field = $c->request->param('field');
	@fields = split / /, $field;
	$c->session->{one} = $fields[0];
	$c->session->{two} = $fields[1];
	$c->session->{three} = $fields[2];
	my @ads;
	my @search;
	my $ref;
	@ads = $c->model('DB::yesterday')->all;

	for (@ads) {
		if ($_->title =~ /$fields[0]/) {
		push (@search, $_);
	}
}	
	if ($fields[1]) {
		for (@ads) {
			if ($_->title =~ /$fields[1]/) {
			push (@search, $_);
		}
	}	
}
		if ($fields[2]) {
		for (@ads) {
			if ($_->title =~ /$fields[1]/) {
			push (@search, $_);
		}
	}	
}	
	@search = uniq(@search);
	$ref = \@search;
	$c->stash(ads => $ref);
	
	
       sub uniq {
    my %seen = ();
    my @r = ();
    foreach my $a (@_) {
        unless ($seen{$a}) {
            push @r, $a;
            $seen{$a} = 1;
        }
    }
    return @r;
}
    
        # Set the TT template to use.  You will almost always want to do this
        # in your action methods (action methods respond to user input in
        # your controllers).
        $c->stash(template => 'ads/list.tt2');

	
 
  

}

=head2 base
    
    Can place common logic to start chained dispatch here
    
=cut
    
    sub base :Chained('/') :PathPart('ads') :CaptureArgs(0) {
        my ($self, $c) = @_;
    
        # Store the ResultSet in stash so it's available for other methods
        $c->stash(resultset => $c->model('DB::Today'));
        $c->stash(resultset => $c->model('DB::Yesterday'));
        # Print a message to the debug log
        $c->log->debug('*** INSIDE BASE METHOD ***');
    }


=head2 object
    
    Fetch the specified book object based on the book ID and store
    it in the stash
    
=cut
    
    sub object :Chained('base') :PathPart('id') :CaptureArgs(1) {
        # $id = primary key of book to delete
        my ($self, $c, $id) = @_;
    
        # Find the book object and store it in the stash
        $c->stash(object => $c->stash->{resultset}->find($id));
    
        # Make sure the lookup was successful.  You would probably
        # want to do something like this in a real app:
        #   $c->detach('/error_404') if !$c->stash->{object};
        die "Book $id not found!" if !$c->stash->{object};
    
        # Print a message to the debug log
        $c->log->debug("*** INSIDE OBJECT METHOD for obj id=$id ***");
    }


=head2 delete
    
    Delete a book
    
=cut
    
    sub delete :Chained('object') :PathPart('delete') :Args(0) {
        my ($self, $c) = @_;
	my $var1 = $c->session->{one};
	my $var2 = $c->session->{two};
    	my $var3 = $c->session->{three};
        # Use the book object saved by 'object' and delete it along
        # with related 'book_author' entries
        $c->stash->{object}->delete;
    
        # Set a status message to be displayed at the top of the view
        $c->stash->{status_msg} = "Book deleted.";
    
        # Forward to the list action/method in this controller
        $c->forward('list');
	$c->response->redirect( "http://0.0.0.0:3000/ads/list?field=$var1+$var2+$var3" );
	   

}



=head1 AUTHOR

jack,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;