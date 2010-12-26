package Mojolicious::Plugin::Modware;

use strict;

# Other modules:
use Modware::DataSource::Chado;
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
        $attr = $database->{attr} || {};
    }
    Modware::DataSource::Chado->connect(
        dsn      => $dsn,
        user     => $user,
        password => $password,
        attr     => $attr
    );
    my $instance = Modware::DataSource::Chado->instance;

    if ( !$app->can('modware') ) {
        ref($app)->attr( 'modware' => sub {$instance} );
    }
}

1;    # Magic true value required at end of module

__END__

=head1 NAME

B<Mojolicious::Plugin::Modware> - [Mojolicious plugin for loading Modware module]


