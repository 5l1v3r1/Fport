#!/usr/bin/perl
use IO::Socket;
use Term::ANSIColor;
use warnings;
use strict;

AGAIN_DO:
print color("red"), qq ( 
88888888888                                         
88                                           ,d     
88                                           88     
88aaaaa 8b,dPPYba,   ,adPPYba,  8b,dPPYba, MM88MMM  
88""""" 88P'    "8a a8"     "8a 88P'   "Y8   88     
88      88       d8 8b       d8 88           88     
88      88b,   ,a8" "8a,   ,a8" 88           88,    
88      88`YbbdP"'   `"YbbdP"'  88           "Y888  
        88                                          
        88   [@] By [MOHAMMED ADEL]     
        ), color("reset");
print color("white"), "\n[!] 1- Singal Port Scanning [!]";
print "\n[!] 2- Range Of Ports Scanning [!]";
print "\n[!] 3- Scan a List of sites for a specific port [!] ", color("reset");
print color("yellow"), "\n\n\n[@] Option ? (1/2/3)  #> ", color("reset");
my $choice = <STDIN>;

if($choice == 1)
{

      print color("yellow"), "\n[+] URL #> ", color("reset");
      chop (my $target = <STDIN>);
      print color("yellow"), "\n[+] Port Number #> ", color("reset");
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
      print color("yellow"), "\n[!] Start Over ? [0/1] #> ", color("reset");
      my $again_choice = <STDIN>;
      if($again_choice == 1)
      {
		  print "\n\n";
          goto AGAIN_DO;
      }
        else
            {
                print color("red"), "\n              [*] Bye ... \n\n", color("reset");
                print color("white"), "              https://github.com/inurlx \n\n", color("reset");
                exit(1);
            }

}

if($choice == 2)

{

      print color("yellow"), "\n[+] URL #> ", color("reset");
      chop (my $target = <STDIN>);
      print color("yellow"), "\n[+] Start Range Port Number #> ", color("reset");
      chop (my $start_port = <STDIN>);
      print color("yellow"), "\n[+] End Range Port Number #> ", color("reset");
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

              print color("yellow"), "\n\n[!] Start Over ? [0/1] #> ", color("reset");
              my $again_choice1 = <STDIN>;
              if($again_choice1 == 1)
                  {
					print "\n\n";
                    goto AGAIN_DO;
                  }
                    else
                      {
                        print color("red"), "\n              [*] Bye ... \n\n", color("reset");
                        print color("white"), "              https://github.com/inurlx \n\n", color("reset");
                        exit(1);
                      }
}

if($choice == 3)
{
    print color("red"), "\n\n[***] The File That Contains The Sites Should Be On The Same Directory [***]\n", color("reset");
    print color("red"), "\n[***] Sites Attach in the file must be without HTTP:// [***]", color("reset");
    print color("yellow"), "\n\n[+] Port Number #> ";
    chop (my $portNo = <STDIN>);
    print color("yellow"), "\n\n[+] File Name (1.txt) #> ", color("reset");
	chop (my $file = <STDIN>);
	open my $info, $file or die " [!] Could not open $file: $! [!] ";
	print color("blue"), "\n\n[**] Reading Info ... ", color("reset");
  print color("white"), "\n\n-------------------------------------------------------------------------\n", color("reset");

	
	while( my $site_file = <$info>)  
	{   
		my $targetList;
		chop ($targetList = $site_file);
	
	
	  foreach($portNo)

  {
          print color("white"),"\n[+] Scanning Port [ $portNo ] For [ $targetList ] \n\n", color("reset");
      my $socket = IO::Socket::INET->new(PeerAddr => $targetList , PeerPort => $portNo , proto => 'tcp' , Timeout => 1);

  if($socket)
    {
      print color("green"), "\[T] Port [ $portNo ] is OPEN IN * [ $targetList ] ", color("reset");
    }
    else 
    {
            print color("red"), "[F] Port [ $portNo ] is CLOSED IN * [ $targetList ]", color("reset");
    }
    
    
  }
                print color("white"), "\n\n[#] Done Scanning [$targetList]\n", color("reset");
                print color("white"), "\n-------------------------------------------------------------------------\n", color("reset");


			
		}
		
		close $info;
		
              print color("yellow"), "\n\n[!] Start Over ? [0/1] #> ", color("reset");
              my $again_choice3 = <STDIN>;
              if($again_choice3 == 1)
                  {
					print "\n\n";
                    goto AGAIN_DO;
                  }
                    else
                      {
                        print color("red"), "\n              [*] Bye ... \n\n", color("reset");
                        print color("white"), "              https://github.com/inurlx \n\n", color("reset");
                        exit(1);
                      }
}
