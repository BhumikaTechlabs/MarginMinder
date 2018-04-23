#!/usr/bin/perl 

package Reply;
use communicator;
sub new {
   my $class = shift;
   my $self = {
      _id => shift,
      _number => shift,
      _message => shift,
      _HSN => shift,
      _SP => shift,
      _CP => shift,
      _MM =>shift,
   };
   bless $self, $class;
   return $self;
}

sub getID {
   my ( $self ) = @_;
   return $self->{_id};
}

sub getNumber {
   my ( $self ) = @_;
   return $self->{_number};
}

sub getMessages {
   my ( $self ) = @_;
   return $self->{_message};
}

sub getHSN {
   my ( $self ) = @_;
   return $self->{_HSN};
}

sub getCP {
   my ( $self ) = @_;
   return $self->{_CP};
}

sub getSP {
   my ( $self ) = @_;
   return $self->{_SP};
}

sub getMM {
   my ( $self ) = @_;
   return $self->{_MM};
}


sub setInboxID {
   my ( $self, $ID ) = @_;
   $self->{_inbox_id} = $ID if defined($ID);
   return $self->{_inbox_id};
}


sub setCodes {
	my ( $self ) = @_;
	my @rep5;
	my $com = new communicator();
	my $success=1;
	my $req=1;
	my $num=substr($self->getNumber(),2);
	if (!(scalar grep /^$num$/,@{$com->getContacts()})) { $req = 0; }
	print "\n".substr($self->getNumber(),2)."\n";
	my $msg = $self->{_message};
	$msg = substr($msg,index($msg,"6CA8E")+7);
	my $i=0;
	for($i=0 ; $i<5 ; $i++){
	my ($hsn, $cp , $sp ,$mm) = ($msg =~ m/(\d+) (\d+) (\d+) (\d+)\n*/);
	my $nid= $self->getID().$hsn;
	if(!(($hsn =~ /^\d{16}$/ )|| ($cp =~ /^\d+$/ )||($sp =~ /^\d+$/ )||($mm =~ /^\d+$/ ))){
	$success=0;}
	push @rep5,new Reply($nid,$self->getNumber(),$msg,$hsn,$cp,$sp,$mm);
	$msg = substr($msg,index($msg,"\\n")+1);
	}
	return \@rep5,$success,$req;

}

sub addturnover(){
	my ( $self ) = @_;
	my $com = new communicator();
	my $msg = $self->getMessages();
	my ($tt,$c1,$c2,$c3,$c4,$c5) = ($msg =~ m/HQLCM (\d+) (\d+) (\d+) (\d+) (\d+) (\d+)/);
	$com->addCompany($self->getNumber(),$tt,$c1,$c2,$c3,$c4,$c5);
}

1;
