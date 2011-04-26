package Mojolicious::Plugin::YmlConfig;

use strict;

# Other modules:
use YAML qw/LoadFile/;
use base qw/Mojolicious::Plugin/;

# Module implementation
#

sub register {
    my ( $self, $app, $conf ) = @_;
    my $file;
    if ( defined $conf->{file} ) {
        $file = $conf->{file};
    }
    else {
        my $file_name = $app->mode . '.yaml';
        $file = $app->home->rel_file("conf/$file_name");
    }
    die "file $file does not exist\n" if !-e $file;

    my $stash_key = $conf->{stash_key} ? $conf->{stash_key} : 'config';
    my $data_str = LoadFile($file);

    if ( !$app->can($stash_key) ) {
    	$app->log->debug("got key $stash_key");
        ref($app)->attr( $stash_key => sub {$data_str} );
    }
}

1;    # Magic true value required at end of module

__END__

=head1 NAME

B<Mojolicious::Plugin::YmlConfig> - [Mojolicious plugin for loading yaml config file]


