package App::PYX2XML;

# Pragmas.
use strict;
use warnings;

# Modules.
use Getopt::Std;
use PYX::SGML::Tags;
use Tags::Output::Indent;
use Tags::Output::Raw;

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process arguments.
	$self->{'_opts'} = {
		'h' => 0,
		'i' => 0,
	};
	if (! getopts('hi', $self->{'_opts'}) || $self->{'_opts'}->{'h'}
		|| @ARGV < 1) {

		print STDERR "Usage: $0 [-h] [-i] [--version] [filename] [-]\n";
		print STDERR "\t-h\t\tPrint help.\n";
		print STDERR "\t-i\t\tIndent output.\n";
		print STDERR "\t--version\tPrint version.\n";
		print STDERR "\t[filename]\tProcess on filename\n";
		print STDERR "\t[-]\t\tProcess on stdin\n";
		exit 1;
	}
	$self->{'_filename_or_stdin'} = $ARGV[0];

	# Object.
	return $self;
}

# Run script.
sub run {
	my $self = shift;

	# Tags object.
	my $tags;
	my %params = (
		'xml' => 1,
		'output_handler' => \*STDOUT,
	);
	if ($self->{'_opts'}->{'i'}) {
		$tags = Tags::Output::Indent->new(%params);
	} else {
		$tags = Tags::Output::Raw->new(%params);
	}

	# PYX::SGML::Tags object.
	my $writer = PYX::SGML::Tags->new(
		'tags' => $tags,
	);

	# Parse from stdin.
	if ($self->{'_filename_or_stdin'} eq '-') {
		$writer->parse_handler(\*STDIN);

	# Parse file.
	} else {
		$writer->parse_file($self->{'_filename_or_stdin'});
	}
	print "\n";

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

App::PYX2XML - Perl class for pyx2xml application.

=head1 SYNOPSIS

 use App::PYX2XML;
 my $obj = App::PYX2XML->new;
 $obj->run;

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<run()>

 Run.

=back

=head1 ERRORS

 new():
         From Class::Utils:
                 Unknown parameter '%s'.

=head1 EXAMPLE

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

=head1 DEPENDENCIES

L<Getopt::Std>,
L<PYX::SGML::Tags>,
L<Tags::Output::Indent>,
L<Tags::Output::Raw>.

=head1 REPOSITORY

L<https://github.com/tupinek/App-PYX2XML>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2015-2016 Michal Špaček
 BSD 2-Clause License

=head1 VERSION

0.01

=cut
