#!/usr/bin/perl
#!/usr/bin/module

use strict;
use LWP::Simple;

my $apiKey = "apikey=" . 'kjefiushfvsidfc';
my $message = "&message=" . "This is your message mr. Floopy";
my $sender = "&sender=" . "TXTLCL";
my $number = "&numbers=" . "9764947095";

my $getString = join "", "https://api.textlocal.in/send/?", $apiKey,  $message, $sender, $number;
my $contents = get($getString);
print $contents;
