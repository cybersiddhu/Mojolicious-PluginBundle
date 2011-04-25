use Test::More qw/no_plan/;
use Test::Mojo;
use File::Spec::Functions;
use Module::Build;
use FindBin;
use lib "$FindBin::Bin/lib/product/lib";

BEGIN {
    $ENV{MOJO_LOG_LEVEL} ||= 'fatal';
}


use_ok('product');
my $test = Test::Mojo->new( app => 'product' );
$test->get_ok('/product')->status_is(200)->content_like(
    qr/list of product/, 'It shows
the list of product'
);

$test->get_ok('/product/cd')->status_is(200)
    ->content_like( qr/cd/, 'It has type of product' );
$cache_file = catfile( $app_home_public, 'product', 'cd.html' );
is( -e $cache_file, 1, 'It has generated cd.html file' );
$dom->parse( Mojo::Asset::File->new( path => $cache_file )->slurp );
like( $dom->at('b')->text, qr/cd/,
    "It has bold html element in the cached html file" );

$test->get_ok('/product/dvd')->status_is(200)
    ->content_like( qr/dvd/, 'It has dvd as product' );
$cache_file = catfile( $app_home_public, 'product', 'dvd.html' );
is( -e $cache_file, 1, 'It has generated dvd.html file' );
$dom->parse( Mojo::Asset::File->new( path => $cache_file )->slurp );
like( $dom->at('b')->text, qr/dvd/,
    "It has bold html element in the cached html file" );

$test->get_ok('/product/dvd/13')->status_is(200)
    ->content_like( qr/dvd/, 'It has dvd as product' );
$cache_file = catfile( $app_home_public, 'product', 'dvd', '13.html' );
is( -e $cache_file, 1, 'It has generated 13.html file' );
$dom->parse( Mojo::Asset::File->new( path => $cache_file )->slurp );
like( $dom->at('h1')->text,
    qr/13/, " It has h1 html element in the cached html file " );


