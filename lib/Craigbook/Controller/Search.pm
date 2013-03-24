package Craigbook::Controller::Search;
use Moose;
use namespace::autoclean;
BEGIN { extends 'Catalyst::Controller::REST'; }
 
 
 
 
sub base : Chained('/') PathPart('') CaptureArgs(0) {
    my ($self, $c) = @_;
    my $data = $c->req->data || $c->req->params;
    my $results = $c->model('Search')->results( 
        terms => $data->{'q'}, 
        index => $data->{'index'} || "default", 
        type => $data->{'type'} || "post"
    );
    my @results;
    for my $result ( @{$results->{'hits'}{'hits'}} ) {
        my $r = $result->{'_source'};
        my $body = substr($r->{'body'}, 0, 300);
        $body .= "...";
        push @results, {
            display_title => $r->{'display_title'},
            title   => $r->{'title'},
            created => $r->{'created'},
            updated => $r->{'updated'},
            author  => $r->{'author'},
            body    => $body,
        };
 
    }
   $c->stash( results => \@results ); 
 
}
 
 
 
 
sub index :Chained('base') PathPart('search') Args(0) ActionClass('REST'){
    my ($self, $c) = @_;
 
}
 
sub index_GET {
    my ($self, $c) = @_;
    $self->status_ok($c, 
        entity => {
            results => $c->stash->{'results'} ,
        },
    );
}
 
 
 
 
 
 
 
__PACKAGE__->meta->make_immutable;
1;
