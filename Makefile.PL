# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl class for pyx2xml application.';
author 'Michal Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.08;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
install_script 'bin/pyx2xml';
license 'bsd';
name 'App-PYX2XML';
readme_from 'bin/pyx2xml';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.05;
requires 'Error::Pure' => 0.15;
requires 'PYX::Parser' => 0.01;
requires 'PYX::Utils' => 0.01;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=App-PYX2XML';
resources 'homepage' => 'https://github.com/tupinek/App-PYX2XML';
resources 'repository' => 'git://github.com/tupinek/App-PYX2XML';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
