use strict;
use warnings;

use App::PYX2XML;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($App::PYX2XML::VERSION, 0.03, 'Version.');
