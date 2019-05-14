#!/usr/bin/perl

use Net::Ping;

open(INFILE, "<", "Major-IP-List.txt") or die("cannot open infile:  $!");

my @ip_array = <INFILE>;

close(INFILE);

open(OUTFILE, ">", "ping_output") or die("unable to write output: $!");


chomp(@ip_array);

$p = Net::Ping->new();

foreach(@ip_array)
  {
   if($_ =~ /\d+.\d+.\d+.\d+/)
      {
        if($p->ping($&))
          {
            print OUTFILE ("$`is responding to ping.\n");
          }
        else
          {
            print OUTFILE ("$`is NOT responding to ping.\n");
          }
      }

  }

close(OUTFILE);
