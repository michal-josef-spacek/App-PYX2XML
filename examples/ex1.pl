#!/usr/bin/env perl

use strict;
use warnings;

use App::PYX2XML;

# Run.
exit App::PYX2XML->new->run;

# Output:
# Usage: ./examples/ex1.pl [-e in_enc] [-h] [-i] [--version] [filename] [-]
#         -e in_enc       Input encoding (default value is utf-8).
#         -h              Print help.
#         -i              Indent output.
#         --version       Print version.
#         [filename]      Process on filename
#         [-]             Process on stdin