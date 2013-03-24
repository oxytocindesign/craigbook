use strict;
use warnings;

use Craigbook;

my $app = Craigbook->apply_default_middlewares(Craigbook->psgi_app);
$app;

