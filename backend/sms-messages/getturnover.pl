#!/usr/bin/env perl    
     
    use strict;
    use Inbox;
    use Reply;
    use communicator;
    use Firebase;
    use LWP::UserAgent;
    use HTTP::Request::Common;
     
    my $apikey = 'iwXqJZ7rSsM-PfvtkQMLGN0aRVHnVR4DmvKyKOdU12';
    #my $apikey = 'BOAJMkYAZLg-fbD8W1louO1DHNDTFTsh7SOGobbLYA';
    my $inboxID = '10';
    my $ua = LWP::UserAgent->new();
    my $com=new communicator();
     
    my $res = $ua->request
    (
     POST 'https://api.textlocal.in/get_messages/?',
     Content_Type  => 'application/x-www-form-urlencoded',
     Content       => [
     					'apikey'   => $apikey,
                        'inbox_id' => $inboxID
                      ]
    );
     
    if ($res->is_error) { die "HTTP Error\n"; }
    print "Response:\n\n" . $res->content . "\n\n";
    print "Response:\n\n" . $res . "\n\n";
	
	my $con=$res->content;
	my $in = $com->createInbox($con);
	my $replylist = $in->getList();
	my @replist = @{ $replylist };
	print "REPLY LIST @replist ".$replylist;
	my $rep;
	my $l;
	foreach $rep (@replist)
	{
		$rep->addturnover();
    		#$com->addReply($rep);
		
		#set ack feild 
		
		#print "S:".$s."\n\n";
		#if($s==1 && $r==1){
		#my @lrr = @{ $lr };
		#foreach $l (@lrr){
		#	$com->addReply($l);
		#}
		#$com->sendAck($rep->getNumber(),"Your response is recorded");
		#print "Your response is recorded \n"
		#}
		#elsif($s==0){
		#$com->sendAck($rep->getNumber(),"Incorrect format");
		#print "Incorrect format \n"
		#}elsif($r==0){
		#}
		#print "\n\nSUCCESS:".$s."REQUIRED:".$r."\n";
		#print "\n\nREPLY INSERTED".$rep->getID()."\n";
	}
#{
	#my $inbox= new Inbox( "10", 2, 235);
	#my $inboxid= $inbox->getInboxID();
	#print "INBOXID: $inboxid \n\n";
	#print (index($con,":"),"\n\n");
	#print (index($con,","),"\n\n");
	#my $iID = substr($con,index($con,":")+1,index($con,",")-index($con,":")-1);
	#print $iID;
	#my $inbox2= new Inbox( $iID, 2, 235);
	#print "inbox ID: ".$inbox2->getInboxID()."\n\n\n";
	#my $subcon = substr($con,index($con,",")+1);
	#my $noofmsg = substr($subcon,index($subcon,":")+1,index($subcon,",")-index($subcon,":")-1);
#	my $rep = new Reply("43","5","234");
#	my $lep = new Reply("2","11","22");
#	my @gort = [];
#	my $inbox3 = new Inbox( $iID, $noofmsg , @gort );
#	my @swdw = $inbox3->getList();
#	my $wer="";
#	my $r = 0;
#
#	for ($r = 0; $r < $noofmsg; $r = $r + 1){
#
#	my $subcon2="";
#
#	if($r != 0){
#	$subcon2 = substr($wer,index($wer,"},{")+3);
#	}
#	else{
#	$subcon2 = substr($subcon,index($subcon,"\"messages\""));
#	}
#
#
#	my $rid = substr($subcon2,index($subcon2,"\":\"")+3,index($subcon2,"\",\"")-index($subcon2,"\":\"")-3);
#	my $subcon3 = substr($subcon2,index($subcon2,"\",\"")+3);
#	my $num = substr($subcon3,index($subcon3,":")+1,index($subcon3,",")-index($subcon3,":")-1);
#	my $subcon4 = substr($subcon3,index($subcon3,",")+1);
#	my $msg= substr($subcon4,index($subcon4,"\":\"")+3,index($subcon4,"\",\"")-index($subcon4,"\":\"")-3);
#	my $gep=new Reply($rid, $num, $msg);
#	
#	#$com->addReply($gep);
#	$com->addReplyInCloud($gep);
#	push @swdw,$gep;
#	$inbox3->setMessageList(@swdw);
#	my @ewdw = $inbox3->getList();
#	print $swdw[-1]->getID()."\n\n";
#	$wer = $subcon4;

#	}
#}

#print "debug";
#	my $fb = Firebase->new(firebase => 'marginminder-e6fc0', auth => { secret => 'w0SBCjYMFdHb4wE5GSJTT5WXqDblQwEiv0wAxLTK', data => { uid => 'v7vHHQQ3XHbgTdFhPd2VgbpXoKC2', username => 'suchi1996.14@gmail.com' }, admin => \1 } );

#my $req = { rid => ""};
#print "debug";
#my $u = "inbox";
#print "debug";
#my $result = $fb->put($u ,$req);

#print "debug";

#<script src="https://www.gstatic.com/firebasejs/4.12.0/firebase.js"></script>
#<script>
 # // Initialize Firebase
  #var config = {
   # apiKey: "AIzaSyAIlOkn2KvU_ybi-zI56B8cR3aUxSVFOww",
    #authDomain: "marginminder-e6fc0.firebaseapp.com",
    #databaseURL: "https://marginminder-e6fc0.firebaseio.com",
    #projectId: "marginminder-e6fc0",
    #storageBucket: "marginminder-e6fc0.appspot.com",
    #messagingSenderId: "496510305372"
  #};
  #firebase.initializeApp(config);

#</script>





	
	










