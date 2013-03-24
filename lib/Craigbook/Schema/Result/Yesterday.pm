use utf8;
package Craigbook::Schema::Result::Yesterday;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Craigbook::Schema::Result::Yesterday

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

=head1 TABLE: C<yesterday>

=cut

__PACKAGE__->table("yesterday");

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:B2WzK0jSslcz3aAdSG9TYA
# These lines were loaded from '/etc/perl/Craigbook/Schema/Result/Yesterday.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package Craigbook::Schema::Result::Yesterday;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Craigbook::Schema::Result::Yesterday

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

=head1 TABLE: C<yesterday>

=cut

__PACKAGE__->table("yesterday");

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
);

=head1 PRIMARY KEY

=over 4

=item * L</title>

=back

=cut

__PACKAGE__->set_primary_key("title");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2013-02-28 15:28:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cw9fQzY00OE6GHXr3+gp1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
# End of lines loaded from '/etc/perl/Craigbook/Schema/Result/Yesterday.pm' 


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
