#!/usr/bin/env perl
#!/usr/bin/perl
 
use strict;
use communicator;
use LWP::UserAgent;
use HTTP::Request::Common;
 
#language
#my $apikey = 'iwXqJZ7rSsM-PfvtkQMLGN0aRVHnVR4DmvKyKOdU12';



my $con = new communicator();
my $apikey = 'BOAJMkYAZLg-fbD8W1louO1DHNDTFTsh7SOGobbLYA';
my $sender = "TXTLCL";
my $numbers = "9764947095,7016545505";
my $message = "HQLCM kindly provide entire turnover of your company in the followed by percentage contribution of top 5 selling products format :6CA8E <total_turn_over> <product1_turnover>....<product5_turnover>";

my $clist = $con->getContacts();
my @cl = @{ $clist };
my $cll;
foreach $cll (@cl){
	$numbers = $numbers.",".$cll;
}

my $ua = LWP::UserAgent->new();
 
my $res = $ua->request
(
 POST 'https://api.textlocal.in/send/?',
 Content_Type  => 'application/x-www-form-urlencoded',
 content => [
		'apikey'	=> $apikey,
		'numbers'	=> $numbers,
		'message'	=> $message,
		'sender'	=> $sender
		]
);
 
if ($res->is_error) { 
print "Response:\n\n" . $res->content . "\n\n";
die "HTTP Error\n"; }
print "Response:\n\n" . $res->content . "\n\n";
