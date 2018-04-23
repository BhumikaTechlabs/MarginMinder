#!/usr/bin/perl

my $time = "23:35:4546";
my ($hours, $minutes, $seconds) = ($time =~ m/(\d+):(\d+):(\d+)/);
print $hours.":".$minutes.":".$seconds."\n\n";
my ($hsn, $cp , $sp , $rest) = ($msg =~ m/(\d+) (\d+) (\d+) (\d+)\n(\d+)/);
