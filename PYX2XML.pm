package App::PYX2XML;

# Pragmas.
use strict;
use warnings;

# Modules.
use Getopt::Std;
use PYX::Write::Tags;
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
		'x' => 0,
	};
	if (! getopts('hix', $self->{'_opts'}) || $self->{'_opts'}->{'h'}
		|| @ARGV < 1) {

		print STDERR "Usage: $0 [-h] [-i] [-x] [--version] [filename] [-]\n";
		print STDERR "\t-h\t\tPrint help.\n";
		print STDERR "\t-i\t\tIndent output.\n";
		print STDERR "\t-x\t\tXML mode.\n";
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
		$self->{'_opts'}->{'x'} ? ('xml' => 1) : (),
		'output_handler' => \*STDOUT,
	);
	if ($self->{'_opts'}->{'i'}) {
		$tags = Tags::Output::Indent->new(%params);
	} else {
		$tags = Tags::Output::Raw->new(%params);
	}

	# PYX::Write::Tags object.
	my $writer = PYX::Write::Tags->new(
		'tags_obj' => $tags,
	);

	# Parse from stdin.
	if ($self->{'_filename_or_stdin'} eq '-') {
		$writer->parse_handler(\*STDIN);

	# Parse file.
	} else {
		$writer->parse_file($self->{'_filename_or_stdin'});
	}

	$tags->flush;
	print "\n";

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

App::PYX2XML - Perl class for video-generator application.

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
 # TODO

=head1 DEPENDENCIES

L<Getopt::Std>,
L<PYX::Write::Tags>,
L<Tags::Output::Indent>,
L<Tags::Output::Raw>.

=head1 REPOSITORY

L<https://github.com/tupinek/App-PYX2XML>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2015 Michal Špaček
 BSD 2-Clause License

=head1 VERSION

0.01

=cut
