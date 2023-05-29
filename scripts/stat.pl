#!/usr/bin/env perl

use strict;
use warnings;
 
my @stats;
my $file = shift or die "Usage: $0 FILENAME [OPTS] STAT#\n";

if (join(" ", @ARGV) =~ /L/) {
	@stats = stat($file);
	shift @ARGV;
} else {
	@stats = lstat($file);
}

for (my $i = 0; $i < @ARGV; $i++) {
	if ($ARGV[$i] eq "l") {
		print "$file -> " . readlink($file) if readlink($file);
	} elsif ($ARGV[$i] == 2) {
		printf "%04o ", $stats[2] & 07777;
	} else {
		print $stats[$ARGV[$i]] . " ";
	}
}

print "\n";
