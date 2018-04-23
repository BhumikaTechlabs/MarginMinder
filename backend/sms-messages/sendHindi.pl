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
my $numbers = "9764947095";
my $message = "कृपया अपने शीर्ष पांच उत्पादों के विवरण निम्न प्रारूप में भेजें:


जीएसटीएन-एचएसएन 1, बिक्री मूल्य 1, खरीद मूल्य 1, ट्रेड हाशिए 1

जीएसटीएन-एचएसएन 2, बिक्री मूल्य 2, खरीद मूल्य 2, व्यापार हाशिए 2

जीएसटीएन-एचएसएन 3, बिक्री मूल्य 3, खरीद मूल्य 3, ट्रेड हाशिए 3

जीएसटीएन-एचएसएन 4, बिक्री मूल्य 4, खरीद मूल्य 4, व्यापार मार्जिन 4

जीएसटीएन-एचएसएन 5, बिक्री मूल्य 5, खरीद मूल्य 5, व्यापार मार्जिन 5

कुल बिक्री
";

#my $clist = $con->getContacts();
#my @cl = @{ $clist };
#my $cll;
#foreach $cll (@cl){
#	$numbers = $numbers.",".$cll;
#}

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
