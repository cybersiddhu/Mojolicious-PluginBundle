package Book;

use strict;
use base 'Mojolicious';
use File::Spec::Functions;

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;
    $self->plugin( 'asset_tag_helpers');
    my $books = $r->route('/books')->to('controller-cache#books');
}

1;
