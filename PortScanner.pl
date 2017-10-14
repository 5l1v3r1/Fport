#!/usr/bin/perl
use IO::Socket;
use Term::ANSIColor;
use warnings;
use strict;

print color("blue"), "\n\n                   [@] By [MOHAMMED ADEL] \n", color("reset");
print color("red"), "\n[!] 1- Singal Port Scanning [!]";
print "\n[!] 2- Range Of Ports Scanning [!]", color("reset");
AGAIN_DO:
print color("yellow"), "\n\n\nWould you like to scan one port or range of ports ? (1/2) --> ", color("reset");
my $choice = <STDIN>;

if($choice == 1)
{

      print color("yellow"), "\n\nEnter URL --> ", color("reset");
      chop (my $target = <STDIN>);
      print color("yellow"), "\nEnter A Port Number --> ", color("reset");
      chop (my $single_port = <STDIN>);

  foreach(my $port = $single_port)

  {
      print color("blue"),"\n[+] Scanning Port [$port] ... ", color("reset");
      my $socket = IO::Socket::INET->new(PeerAddr => $target , PeerPort => $port , proto => 'tcp' , Timeout => 1);

  if($socket)
    {
      print color("green"), "\n\n[T] Port [$port] is open.\n", color("reset");
    }
    else
    {
      print color("red"), "\n\n[F] Port [$port] is Closed ", color("reset");

    }
  }
      print color("white"), "\n\n[#] Done Scanning [$target]\n\n", color("reset");
      print color("yellow"), "\n\n[!] Would you like to start over ? [0/1] -- > ", color("reset");
      my $again_choice = <STDIN>;

      if($again_choice == 1)
      {
          goto AGAIN_DO;
      }
        else
            {
                print color("red"), "\n              [*] Shutting Down ... \n\n", color("reset");
                print color("white"), "              https://github.com/inurlx \n\n", color("reset");
                exit(1);
            }

}

if($choice == 2)

{

      print color("yellow"), "\n\nEnter URL --> ", color("reset");
      chop (my $target = <STDIN>);
      print color("yellow"), "\nStart Range Port --> ", color("reset");
      chop (my $start_port = <STDIN>);
      print color("yellow"), "\nEnd Range Port --> ", color("reset");
      chop (my $end_port = <STDIN>);

      my $port;


    foreach (my $port = $start_port ; $port <= $end_port ; $port++)
  {
      print color("blue"),"\n[+] Scanning Port [$port] ... ", color("reset");
      my $socket = IO::Socket::INET->new(PeerAddr => $target , PeerPort => $port , Proto => 'tcp' , Timeout => 1);

      if( $socket )
      {
          print color("green"), "\n\n[T] Port [$port] is open.\n", color("reset");
      }
        else
          {
            print color("red"), "\n\n[F] Port [$port] is Closed \n", color("reset");
          }
  }

              print color("white"), "\n\n[#] Done Scanning [$target]\n\n", color("reset");

              print color("yellow"), "\n\n[!] Would you like to start over ? [0/1] -- > ", color("reset");
              my $again_choice1 = <STDIN>;

              if($again_choice1 == 1)
                  {
                    goto AGAIN_DO;
                  }
                    else
                      {
                        print color("red"), "\n              [*] Shutting Down ... \n\n", color("reset");
                        print color("white"), "              https://github.com/inurlx \n\n", color("reset");
                        exit(1);
                      }
}
