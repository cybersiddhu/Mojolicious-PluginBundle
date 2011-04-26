package Mojolicious::Plugin::Bundle;
use strict;

1;


__END__

# ABSTRACT: Collection of mojolicious plugins

=head1 SYNOPSIS

#In mojolicious application

$self->plugin('yml_config');

$self->plugin('asset_tag_helper');

$self->plugin('bcs');

$self->plugin('bcs-oracle');

=head1 DESCRIPTION

This distribution provides bunch of mojolicious plugins.

=over

=item *

L<YAML Config|Mojolicious::Plugin::YmlConfig>

B<YAML Config> plugin provides helper for loading yaml config file.

=item *

L<AssetTagHelpers|Mojolicious::Plugin::AssetTagHelpers>

B<AssetTagHelpers> plugin provides helpers for generating HTML links to view assets such as
images,  stylesheets and javascripts.

=item *

L<BCS|Mojolicious::Plugin::Bcs>

B<BCS> plugin provides a helper for L<Bio::Chado::Schema> module to work with
chado(genomic) database.


L<BCS-Oracle|Mojolicious::Plugin::Bcs::Oracle>

B<BCS-Oracle> is identical with I<BCS> plugin except it is specifically tuned for working
with oracle database.


=back

=over

=item For every plugin refer to its individual documentation.

=back
