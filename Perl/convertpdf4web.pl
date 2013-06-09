#!/usr/bin/perl

$ifile = "magic.tex";
$ofile = "magic_web.tex";
open(IN, $ifile) or die("Cannot read from $ifile");
open(OUT, ">$ofile") or die("Cannot write to $ofile");
while($line = <IN>) {
    if($line =~ /usepackage/ and $line =~ /hyperref/) {
        print OUT "\\usepackage{hyperref}\n\n";
        print OUT "\\hypersetup{\n";
        print OUT "  colorlinks=false,\n";
        print OUT "  linkbordercolor=white,\n";
        print OUT "  pdfborderstyle={/S/U/W 1}\n";
        print OUT "}\n\n";
    }
    else {
        print OUT $line;
    }
}
