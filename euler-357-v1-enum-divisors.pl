#!/usr/bin/perl -ln

use strict;
use warnings;

s/\A([0-9]+):\s*//;
my $n = $1;
my %factors;
foreach my $f (split/\s+/, $_)
{
    die if $f !~ /\S/;
    print"F=$f\n";
    $factors{$f}++;
}
my $root = sqrt($n);

sub my_func
{
    if (!@_)
    {
        return (1);
    }
    else
    {
        my $f = shift;
        print "F/=$f ; %factors = @{[%factors]}\n";
        my @r = my_func(@_);

        my $x = 1;
        my @ret;
        for my $e (0 .. $factors{$f})
        {
            push @ret, map { $x * $_ } @r;
        }
        continue
        {
            $x *= $f;
        }
        return @ret;
    }
};

print join " ", $n, (sort { $a <=> $b } grep { $_ > 1 and $_ <= $root } my_func(keys(%factors)));
