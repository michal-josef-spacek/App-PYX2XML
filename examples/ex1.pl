#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use App::PYX2XML;

# Run.
App::PYX2XML->new->run;

# Output:
# Usage: ./examples/ex1.pl [-h] [-i] [--version] [filename] [-]
#         -h              Print help.
#         -i              Indent output.
#         --version       Print version.
#         [filename]      Process on filename
#         [-]             Process on stdin