#!/usr/bin/perl 
use Search;
use Craigbook::Schema;
use Data::Dumper;

my $schema = Craigbook::Schema->connect("dbi:SQLite:dbname=ads.db", "", "");
my $search = Search->new;
my $rs = $schema->resultset('Yesterday')->search({ title => 'design' });



print "Search obj: " . Dumper $search_obj;
print "Beginning indexing\n";
 
while ( my $entry = $rs->next ) {
   print "Indexing " . $entry->title . "\n";
    my $result = $search_obj->index_data(
        index => 'title',
        type => $entry->type,
        data => {
            title       => $entry->title,
            display_title => $entry->display_title,
            author      => $entry->author->name,
            created     => $entry->created_at ."",
            updated     => $entry->updated_at ."",
            body        => $entry->body,
            attachments => \@attachments,
        },
    );
 
}
