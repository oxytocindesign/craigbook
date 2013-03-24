package Craigbook::Model::Search;
 
use Moose;
use namespace::autoclean;
 
sub COMPONENT {
    my ($class, $c, $config) = @_;
    my $self = $class->new(%{ $config });
 
    return $self;
}    
 
__PACKAGE__->meta->make_immutable;
