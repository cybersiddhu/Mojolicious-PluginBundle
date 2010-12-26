package Mojolicious::Plugin::Bcs;

use strict;

# Other modules:
use Bio::Chado::Schema;
use base qw/Mojolicious::Plugin/;

# Module implementation
#

sub register {
    my ( $self, $app, $conf ) = @_;
    my ( $dsn, $user, $password, $attr );
    if ( defined $conf->{dsn} ) {
        $dsn      = $conf->{dsn};
        $user     = $conf->{user} || '';
        $password = $conf->{password} || '';
        $attr     = $conf->{attr} || {};
    }
    else {
        die "need to load the yml_config\n"
            if not defined !$app->can('config');
        my $opt      = $app->config;
        my $database = $opt->{database};
        if ( defined $database->{dsn} ) {
            $dsn      = $database->{dsn};
            $user     = $database->{user} || '';
            $password = $database->{password} || '';
        }
        $attr = $database->{attr} || { LongReadLen => 2**10 };
    }
    my $schema = Bio::Chado::Schema->connect( $dsn, $user, $password, $attr );

    if ( !$app->can('model') ) {
        ref($app)->attr( 'model' => sub {$schema} );
    }
}

1;    # Magic true value required at end of module

__END__

=head1 NAME

B<Mojolicious::Plugin::Bcs> - [Mojolicious plugin for Bio::Chado::Schema]


