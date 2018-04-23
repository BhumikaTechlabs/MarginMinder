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
my $numbers = "7411222718";
my $message = "IMPORTANT - To complete GSTN procedure for your company kindly provide trade margin details of top 5 selling products of your company in the folowing format :6CA8E <HSN1> <COST_PRICE1> <SELLING_PRICE1> \n please note that there should be one space in between every code or price entered. Enter information for each of the top 5 products in the same format one after the other pressing enter after each product entry.Enter \"6CA8E\" at the beginning of your message. Example:
6CA8E
436794 23 34
593546 67 68
546543 54 89 
432934 233 324 
367942 167 68 
";

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
