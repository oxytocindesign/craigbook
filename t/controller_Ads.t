use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Craigbook';
use Craigbook::Controller::Ads;

ok( request('/ads')->is_success, 'Request should succeed' );
done_testing();
