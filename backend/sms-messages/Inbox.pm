#!/usr/bin/perl 

package Inbox;
sub new {
   my $class = shift;
   my $self = {
      _inbox_id => shift,
      _num_messages => shift,
      @message_list     => shift,
   };
   bless $self, $class;
   return $self;
}

sub getInboxID {
   my ( $self ) = @_;
   return $self->{_inbox_id};
}

sub getNumMessages {
   my ( $self ) = @_;
   return $self->{_num_messages};
}


sub setInboxID {
   my ( $self, $ID ) = @_;
   $self->{_inbox_id} = $ID if defined($ID);
   return $self->{_inbox_id};
}

sub setMessageList {
   my $self = @_[0];
	print " PARAMETER:  @_  \n\n";
   
	push $self->{@message_list},@_[1];

}

sub getList {
  my ( $self ) = @_;
  return \@{$self->{@message_list}};


}



1;
