#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# $Id: Makefile.PL,v 2.5 2000/01/28 01:09:17 sander Exp $
# $Source: /cvsroot/tools/id3v1/Makefile.PL,v $
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require 5.004;
use strict;
use ExtUtils::MakeMaker;

$| = 1;
my $missing_modules = 0;

print "Checking for IO::File....";
eval {
   require IO::File;
};
if ($@) {
   print " failed\n";
   $missing_modules++;
   print <<"EOT";
$@
The IO package must be installed. Just get the latest IO package.
 
EOT
   sleep(2);
} else {
   print " ok\n";
}

print <<EOT if $missing_modules;
The missing modules can be obtained from CPAN.  Visit
<URL:http://www.perl.com/CPAN/> to find a CPAN site near you.

Or use the handy Bundle::CPAN by Andreas Konig.

EOT

# Ok, now it is time to really generate the Makefile

WriteMakefile(
   NAME          => 'MPEG::ID3v1Tag',
   VERSION_FROM  => 'lib/MPEG/ID3v1Tag.pm',
   'dist'        => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);

