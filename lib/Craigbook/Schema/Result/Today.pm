use utf8;
package Craigbook::Schema::Result::Today;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Craigbook::Schema::Result::Today

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<today>

=cut

__PACKAGE__->table("today");

=head1 ACCESSORS

=head2 title

  data_type: 'text'
  is_nullable: 0

=head2 email

  data_type: (empty string)
  is_nullable: 1

=head2 link

  data_type: (empty string)
  is_nullable: 1

=head2 description

  data_type: (empty string)
  is_nullable: 1

=head2 descriptioncode

  data_type: (empty string)
  is_nullable: 1

=head2 titlecode

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "title",
  { data_type => "text", is_nullable => 0 },
  "email",
  { data_type => "", is_nullable => 1 },
  "link",
  { data_type => "", is_nullable => 1 },
  "description",
  { data_type => "", is_nullable => 1 },
  "descriptioncode",
  { data_type => "", is_nullable => 1 },
  "titlecode",
  { data_type => "", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</title>

=back

=cut

__PACKAGE__->set_primary_key("title");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-03-03 13:40:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PJDuq8fTsqXcaDIFtyER2w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
